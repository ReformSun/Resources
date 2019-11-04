## flink 传输的数据格式

### LatencyMarker
org.apache.flink.streaming.runtime.streamrecord. LatencyMarker  
作用：用来衡量代码的执行时间，在source处创建，携带时间戳到sink处，差值就是整个代码的执行时间  
在source中比如org.apache.flink.streaming.api.operators.StreamSource的这个类中的LatencyMarksEmitter的内部类，会定时向下游发送LatencyMarker信息  

```
默认之间周期为0
private static class LatencyMarksEmitter<OUT> {
		private final ScheduledFuture<?> latencyMarkTimer;

		public LatencyMarksEmitter(
				final ProcessingTimeService processingTimeService,
				final Output<StreamRecord<OUT>> output,
				long latencyTrackingInterval,
				final OperatorID operatorId,
				final int subtaskIndex) {

			latencyMarkTimer = processingTimeService.scheduleAtFixedRate(
				new ProcessingTimeCallback() {
					@Override
					public void onProcessingTime(long timestamp) throws Exception {
						try {
							// ProcessingTimeService callbacks are executed under the checkpointing lock
							output.emitLatencyMarker(new LatencyMarker(processingTimeService.getCurrentProcessingTime(), operatorId, subtaskIndex));
						} catch (Throwable t) {
							// we catch the Throwables here so that we don't trigger the processing
							// timer services async exception handler
							LOG.warn("Error while emitting latency marker.", t);
						}
					}
				},
				0L,
				latencyTrackingInterval);
		}

		public void close() {
			latencyMarkTimer.cancel(true);
		}
	}
```
这时会在org.apache.flink.streaming.api.operators.StreamSink中处理数据但是具体处理细节是在org.apache.flink.streaming.util类中  

```
public void reportLatency(LatencyMarker marker) {
		final String uniqueName = granularity.createUniqueHistogramName(marker, operatorId, subtaskIndex);

		DescriptiveStatisticsHistogram latencyHistogram = this.latencyStats.get(uniqueName);
		if (latencyHistogram == null) {
			latencyHistogram = new DescriptiveStatisticsHistogram(this.historySize);
			this.latencyStats.put(uniqueName, latencyHistogram);
			granularity.createSourceMetricGroups(metricGroup, marker, operatorId, subtaskIndex)
				.addGroup("operator_id", String.valueOf(operatorId))
				.addGroup("operator_subtask_index", String.valueOf(subtaskIndex))
				.histogram("latency", latencyHistogram);
		}

		long now = System.currentTimeMillis();
		latencyHistogram.update(now - marker.getMarkedTime());
	}
```

### StreamStatus
org.apache.flink.streaming.runtime.streamstatus.StreamStatus
作用：标示当前流的一个状态，如果是idle标示即将没有元素输入进入空闲状态如果是，active标示将有元素输出，同时，StreamStatus还对如何处理watermark有影响。通过发送status，上游的operator可以很方便的通知下游当前的数据流的状态

例子：source 一个source任务如果被认为是头执行者的话他是idle状态，一个StreamSource在一个无限期的时间内没有记录发送或这kafka消费者在刚开始没有分配分区或者没有从分配的分区中读取记录时。但是一旦这个头执行者发现它将恢复发送数据这个source将被认为是active状态

### Watermark

org.apache.flink.streaming.api.watermark.Watermark

### StreamRecord
org.apache.flink.streaming.runtime.streamrecord. StreamRecord




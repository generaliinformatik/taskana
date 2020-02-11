package pro.taskana.simplehistory.impl;

import pro.taskana.spi.history.api.events.TaskanaHistoryEvent;

/** This entity contains the most important information about a history event. */
public class HistoryEventImpl extends TaskanaHistoryEvent {

  public HistoryEventImpl(String userId) {
    super(userId);
  }
}

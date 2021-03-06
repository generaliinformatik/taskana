package pro.taskana.monitor.api.reports.row;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;

import pro.taskana.common.api.LoggerUtils;
import pro.taskana.monitor.api.reports.Report;
import pro.taskana.monitor.api.reports.item.QueryItem;

/**
 * The FoldableRow extends the {@link SingleRow}. In contrast to the {@link SingleRow} the
 * FoldableRow contains rows which can be collapsed or expanded. The FoldableRow itself displays the
 * sum of all foldable rows.
 *
 * @param <I> the {@link QueryItem} on which the {@link Report} is based on.
 */
public abstract class FoldableRow<I extends QueryItem> extends SingleRow<I> {

  private Map<String, Row<I>> foldableRows = new LinkedHashMap<>();
  private Function<? super I, String> calcFoldableRowKey;
  private int columnSize;

  protected FoldableRow(int columnSize, Function<? super I, String> calcFoldableRowKey) {
    super(columnSize);
    this.columnSize = columnSize;
    this.calcFoldableRowKey = calcFoldableRowKey;
  }

  public final int getFoldableRowCount() {
    return foldableRows.size();
  }

  public final Set<String> getFoldableRowKeySet() {
    return foldableRows.keySet();
  }

  @Override
  public void addItem(I item, int index) throws IndexOutOfBoundsException {
    super.addItem(item, index);
    foldableRows
        .computeIfAbsent(calcFoldableRowKey.apply(item), (s) -> buildRow(columnSize))
        .addItem(item, index);
  }

  @Override
  public void updateTotalValue(I item) {
    super.updateTotalValue(item);
    foldableRows
        .computeIfAbsent(calcFoldableRowKey.apply(item), (s) -> buildRow(columnSize))
        .updateTotalValue(item);
  }

  public Row<I> getFoldableRow(String key) {
    return foldableRows.get(key);
  }

  abstract Row<I> buildRow(int columnSize);

  @Override
  public String toString() {
    return String.format(
        "FoldableRow [detailRows= %s, columnSize= %d]",
        LoggerUtils.mapToString(this.foldableRows), columnSize);
  }
}

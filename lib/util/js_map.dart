part of highcharts.options;

Map addMapValue (Map map, String key, dynamic value) {
  if (value != null) {
    if (value is ToMap) {
      map [key] = value.toMap();
    }
    else if (value is Iterable) {
      List newList = new List ();
      for (var item in value) {
        newList.add(item is ToMap ? item.toMap() : item);
      }
      map [key] = new JsObject.jsify(newList);
    }
    else if (value is Function) {
      map [key] = new JsFunction.withThis(value);
    }
    else {
      map [key] = value;
    }
  }
  return map;
}

void setJsChartList (List<OptionsObject> lst, JsObject jsChart) {
  if (lst != null) { 
    lst.forEach((OptionsObject obj) {
      obj.setJsChart(jsChart);
    });
  }
}

void setJsChartOptionsObject (OptionsObject obj, JsObject jsChart) {
  if (obj != null) 
    obj.jsChart = jsChart;
}
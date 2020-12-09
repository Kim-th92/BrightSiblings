
/**
 * ---------------------------------------
 * This demo was created using amCharts 4.
 * 
 * For more information visit:
 * https://www.amcharts.com/
 * 
 * Documentation is available at:
 * https://www.amcharts.com/docs/v4/
 * ---------------------------------------
 */

// Themes begin
am4core.useTheme(am4themes_animated);


var chart = am4core.create("chartdiv", am4plugins_wordCloud.WordCloud);
chart.fontFamily = "Courier New";
var series = chart.series.push(new am4plugins_wordCloud.WordCloudSeries());
series.randomness = 0;
series.rotationThreshold = 0.6;

series.data = [ {
  "tag": "다봄",
  "count": "1765836"
}, {
  "tag": "DIET",
  "count": "1517355"
}, {
  "tag": "다이어트",
  "count": "1287629"
}, {
  "tag": "식이요법",
  "count": "1263946"
}, {
  "tag": "운동분석",
  "count": "1174721"
}, {
  "tag": "유산소",
  "count": "1116769"
}, {
  "tag": "근력운동",
  "count": "944983"
}, {
  "tag": "닭가슴살",
  "count": "805679"
}, {
  "tag": "DABOM",
  "count": "606051"
}, {
  "tag": "건강",
  "count": "591410"
}, {
  "tag": "칼로리",
  "count": "574684"
}, {
  "tag": "BMI",
  "count": "550916"
}, {
  "tag": "필라테스",
  "count": "479892"
}, {
  "tag": "요가",
  "count": "343092"
}, {
  "tag": "소셜네트워크",
  "count": "303311"
}, {
  "tag": "한방다이어트",
  "count": "296963"
}, {
  "tag": "친구찾기",
  "count": "288445"
}, {
  "tag": "채팅",
  "count": "286823"
}, {
  "tag": "인바디",
  "count": "280079"
}, {
  "tag": "비타민",
  "count": "277144"
}, {
  "tag": "보조제",
  "count": "263451"
}, {
  "tag": "단백질",
  "count": "257159"
} ];

series.dataFields.word = "tag";
series.dataFields.value = "count";

series.heatRules.push({
 "target": series.labels.template,
 "property": "fill",
 "min": am4core.color("#8080ff"),
 "max": am4core.color("#00004d"),
 "dataField": "value"
});

series.labels.template.url = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query={word}";
series.labels.template.urlTarget = "_blank";




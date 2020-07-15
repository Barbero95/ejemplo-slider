import 'package:flutter/material.dart';
import 'package:slidertest/slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Electricidad'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _value1 = 25;
  double _value2 = 25;
  double _value3 = 25;
  double _value4 = 25;
  double _valueTotal = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 5.0),
                      child: Text('Título 1', style: TextStyle(fontSize: 20.0),),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Text('Subtítulo 1', style: TextStyle(fontSize: 15.0),),
                    ),
                    Container(
                      //width: MediaQuery.of(context).size.width - 20,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 25.0),
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    activeTrackColor: Colors.white,
                                    inactiveTrackColor: Colors.grey[300],
                                    trackShape: RectangularSliderTrackShape(disabledThumbGapWidth: 40.0),
                                    trackHeight: 10.0,
                                    thumbShape: CustomSliderThumbRect(
                                        thumbRadius: 20,
                                        thumbHeight: 40.0,
                                        max: 100,
                                        min: 0
                                    ),
                                    overlayColor: Colors.transparent.withAlpha(32),
                                    overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
                                    tickMarkShape: RoundSliderTickMarkShape(),
                                    activeTickMarkColor: Colors.transparent,
                                    inactiveTickMarkColor: Colors.transparent,
                                    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                                    valueIndicatorColor: Colors.transparent,
                                    valueIndicatorTextStyle: TextStyle(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  child: Slider(
                                    value: _value1,
                                    min: 0,
                                    max: 100,
                                    divisions: 20,
                                    label: '$_value1',
                                    onChanged: (value) {
                                      setState(
                                            () {
                                          _value1 = value;
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.all(7.0),
                                width: 37.0,
                                height: 37.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Center(
                                  child: Text(_value1.round().toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.black87),),
                                )
                            )
                          ],
                        )
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 15.0, bottom: 5.0),
                      child: Text('Título 2', style: TextStyle(fontSize: 20.0),),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Text('Subtítulo 2', style: TextStyle(fontSize: 15.0),),
                    ),
                    Container(
                      //width: MediaQuery.of(context).size.width - 20,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 20.0),
                                  child: SliderTheme(
                                    data: SliderTheme.of(context).copyWith(
                                      activeTrackColor: Colors.white,
                                      inactiveTrackColor: Colors.grey[300],
                                      trackShape: RectangularSliderTrackShape(disabledThumbGapWidth: 40.0),
                                      trackHeight: 10.0,
                                      thumbShape: CustomSliderThumbRect(
                                          thumbRadius: 20,
                                          thumbHeight: 40.0,
                                          max: 100,
                                          min: 0
                                      ),
                                      overlayColor: Colors.transparent.withAlpha(32),
                                      overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
                                      tickMarkShape: RoundSliderTickMarkShape(),
                                      activeTickMarkColor: Colors.transparent,
                                      inactiveTickMarkColor: Colors.transparent,
                                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                                      valueIndicatorColor: Colors.transparent,
                                      valueIndicatorTextStyle: TextStyle(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    child: Slider(
                                      value: _value2,
                                      min: 0,
                                      max: 100,
                                      divisions: 20,
                                      label: '$_value2',
                                      onChanged: (value) {
                                        setState(
                                              () {
                                            _value2 = value;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                )
                            ),
                          ],
                        )
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 15.0, bottom: 5.0),
                      child: Text('Título 3', style: TextStyle(fontSize: 20.0),),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Text('Subtítulo 3', style: TextStyle(fontSize: 15.0),),
                    ),
                    Container(
                      //width: MediaQuery.of(context).size.width - 20,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                  child: SliderTheme(
                                    data: SliderTheme.of(context).copyWith(
                                      activeTrackColor: Colors.white,
                                      inactiveTrackColor: Colors.grey[300],
                                      trackShape: RectangularSliderTrackShape(disabledThumbGapWidth: 40.0),
                                      trackHeight: 10.0,
                                      thumbShape: CustomSliderThumbCircle(
                                          thumbRadius: 20.0,
                                          max: 100,
                                          min: 0
                                      ),
                                      overlayColor: Colors.transparent.withAlpha(32),
                                      overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                                      tickMarkShape: RoundSliderTickMarkShape(),
                                      activeTickMarkColor: Colors.transparent,
                                      inactiveTickMarkColor: Colors.transparent,
                                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                                      valueIndicatorColor: Colors.transparent,
                                      valueIndicatorTextStyle: TextStyle(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    child: Slider(
                                      value: _value3,
                                      min: 0,
                                      max: 100,
                                      divisions: 20,
                                      label: '$_value3',
                                      onChanged: (value) {
                                        setState(
                                              () {
                                            _value3 = value;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                )
                            ),
                            Container(
                                margin: EdgeInsets.all(7.0),
                                width: 37.0,
                                height: 37.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Center(
                                  child: Text(_value3.round().toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.black87),),
                                )
                            )
                          ],
                        )
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 15.0, bottom: 5.0),
                      child: Text('Título 4', style: TextStyle(fontSize: 20.0),),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Text('Subtítulo 4', style: TextStyle(fontSize: 15.0),),
                    ),
                    Container(
                      //width: MediaQuery.of(context).size.width - 20,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: Colors.white,
                                  inactiveTrackColor: Colors.grey[300],
                                  trackShape: RectangularSliderTrackShape(disabledThumbGapWidth: 40.0),
                                  trackHeight: 10.0,
                                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                                  thumbColor: Colors.white,
                                  overlayColor: Colors.transparent.withAlpha(32),
                                  overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                                  tickMarkShape: RoundSliderTickMarkShape(),
                                  activeTickMarkColor: Colors.transparent,
                                  inactiveTickMarkColor: Colors.transparent,
                                  valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                                  valueIndicatorColor: Colors.transparent,
                                  valueIndicatorTextStyle: TextStyle(
                                    color: Colors.transparent,
                                  ),
                                ),
                                child: Slider(
                                  value: _value4,
                                  min: 0,
                                  max: 100,
                                  divisions: 20,
                                  label: '$_value4',
                                  onChanged: (value) {
                                    setState(
                                          () {
                                        _value4 = value;
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.all(7.0),
                                width: 37.0,
                                height: 37.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Center(
                                  child: Text(_value4.round().toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.black87),),
                                )
                            )
                          ],
                        )
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      /*Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15.0),
            child: Container(
              child: IgnorePointer(
                ignoring: true,
                child: Container(
                  margin: EdgeInsets.only(left: 25.0),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey[300],
                      trackShape: RectangularSliderTrackShape(disabledThumbGapWidth: 40.0),
                      trackHeight: 10.0,
                      thumbShape: CustomSliderThumbRect(
                          thumbRadius: 20,
                          thumbHeight: 40.0,
                          max: 100,
                          min: 0
                      ),
                      overlayColor: Colors.transparent.withAlpha(32),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
                      tickMarkShape: RoundSliderTickMarkShape(),
                      activeTickMarkColor: Colors.transparent,
                      inactiveTickMarkColor: Colors.transparent,
                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      valueIndicatorColor: Colors.transparent,
                      valueIndicatorTextStyle: TextStyle(
                        color: Colors.transparent,
                      ),
                    ),
                    child: Slider(
                      value: _value1,
                      min: 0,
                      max: 100,
                      divisions: 20,
                      label: '$_value1',
                      onChanged: (value) {
                        setState(
                              () {
                            _value1 = value;
                          },
                        );
                      },
                    ),
                  ),
                ),
              )
            ),
          ),
          Container(

            margin: EdgeInsets.only(top: 20.0),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 5.0),
                            child: Text('Título 1', style: TextStyle(fontSize: 20.0),),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0),
                            child: Text('Subtítulo 1', style: TextStyle(fontSize: 15.0),),
                          ),
                          Container(
                            //width: MediaQuery.of(context).size.width - 20,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 25.0),
                                      child: SliderTheme(
                                        data: SliderTheme.of(context).copyWith(
                                          activeTrackColor: Colors.white,
                                          inactiveTrackColor: Colors.grey[300],
                                          trackShape: RectangularSliderTrackShape(disabledThumbGapWidth: 40.0),
                                          trackHeight: 10.0,
                                          thumbShape: CustomSliderThumbRect(
                                              thumbRadius: 20,
                                              thumbHeight: 40.0,
                                              max: 100,
                                              min: 0
                                          ),
                                          overlayColor: Colors.transparent.withAlpha(32),
                                          overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
                                          tickMarkShape: RoundSliderTickMarkShape(),
                                          activeTickMarkColor: Colors.transparent,
                                          inactiveTickMarkColor: Colors.transparent,
                                          valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                                          valueIndicatorColor: Colors.transparent,
                                          valueIndicatorTextStyle: TextStyle(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        child: Slider(
                                          value: _value1,
                                          min: 0,
                                          max: 100,
                                          divisions: 20,
                                          label: '$_value1',
                                          onChanged: (value) {
                                            setState(
                                                  () {
                                                _value1 = value;
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.all(7.0),
                                      width: 37.0,
                                      height: 37.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                      ),
                                      child: Center(
                                        child: Text(_value1.round().toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.black87),),
                                      )
                                  )
                                ],
                              )
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 15.0, bottom: 5.0),
                            child: Text('Título 2', style: TextStyle(fontSize: 20.0),),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0),
                            child: Text('Subtítulo 2', style: TextStyle(fontSize: 15.0),),
                          ),
                          Container(
                            //width: MediaQuery.of(context).size.width - 20,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 20.0),
                                        child: SliderTheme(
                                          data: SliderTheme.of(context).copyWith(
                                            activeTrackColor: Colors.white,
                                            inactiveTrackColor: Colors.grey[300],
                                            trackShape: RectangularSliderTrackShape(disabledThumbGapWidth: 40.0),
                                            trackHeight: 10.0,
                                            thumbShape: CustomSliderThumbRect(
                                                thumbRadius: 20,
                                                thumbHeight: 40.0,
                                                max: 100,
                                                min: 0
                                            ),
                                            overlayColor: Colors.transparent.withAlpha(32),
                                            overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
                                            tickMarkShape: RoundSliderTickMarkShape(),
                                            activeTickMarkColor: Colors.transparent,
                                            inactiveTickMarkColor: Colors.transparent,
                                            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                                            valueIndicatorColor: Colors.transparent,
                                            valueIndicatorTextStyle: TextStyle(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          child: Slider(
                                            value: _value2,
                                            min: 0,
                                            max: 100,
                                            divisions: 20,
                                            label: '$_value2',
                                            onChanged: (value) {
                                              setState(
                                                    () {
                                                  _value2 = value;
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      )
                                  ),
                                ],
                              )
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 15.0, bottom: 5.0),
                            child: Text('Título 3', style: TextStyle(fontSize: 20.0),),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0),
                            child: Text('Subtítulo 3', style: TextStyle(fontSize: 15.0),),
                          ),
                          Container(
                            //width: MediaQuery.of(context).size.width - 20,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 10.0),
                                        child: SliderTheme(
                                          data: SliderTheme.of(context).copyWith(
                                            activeTrackColor: Colors.white,
                                            inactiveTrackColor: Colors.grey[300],
                                            trackShape: RectangularSliderTrackShape(disabledThumbGapWidth: 40.0),
                                            trackHeight: 10.0,
                                            thumbShape: CustomSliderThumbCircle(
                                                thumbRadius: 20.0,
                                                max: 100,
                                                min: 0
                                            ),
                                            overlayColor: Colors.transparent.withAlpha(32),
                                            overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                                            tickMarkShape: RoundSliderTickMarkShape(),
                                            activeTickMarkColor: Colors.transparent,
                                            inactiveTickMarkColor: Colors.transparent,
                                            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                                            valueIndicatorColor: Colors.transparent,
                                            valueIndicatorTextStyle: TextStyle(
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          child: Slider(
                                            value: _value3,
                                            min: 0,
                                            max: 100,
                                            divisions: 20,
                                            label: '$_value3',
                                            onChanged: (value) {
                                              setState(
                                                    () {
                                                  _value3 = value;
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      )
                                  ),
                                  Container(
                                      margin: EdgeInsets.all(7.0),
                                      width: 37.0,
                                      height: 37.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                      ),
                                      child: Center(
                                        child: Text(_value3.round().toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.black87),),
                                      )
                                  )
                                ],
                              )
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 15.0, bottom: 5.0),
                            child: Text('Título 4', style: TextStyle(fontSize: 20.0),),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0),
                            child: Text('Subtítulo 4', style: TextStyle(fontSize: 15.0),),
                          ),
                          Container(
                            //width: MediaQuery.of(context).size.width - 20,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: SliderTheme(
                                      data: SliderTheme.of(context).copyWith(
                                        activeTrackColor: Colors.white,
                                        inactiveTrackColor: Colors.grey[300],
                                        trackShape: RectangularSliderTrackShape(disabledThumbGapWidth: 40.0),
                                        trackHeight: 10.0,
                                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                                        thumbColor: Colors.white,
                                        overlayColor: Colors.transparent.withAlpha(32),
                                        overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                                        tickMarkShape: RoundSliderTickMarkShape(),
                                        activeTickMarkColor: Colors.transparent,
                                        inactiveTickMarkColor: Colors.transparent,
                                        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                                        valueIndicatorColor: Colors.transparent,
                                        valueIndicatorTextStyle: TextStyle(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      child: Slider(
                                        value: _value4,
                                        min: 0,
                                        max: 100,
                                        divisions: 20,
                                        label: '$_value4',
                                        onChanged: (value) {
                                          setState(
                                                () {
                                              _value4 = value;
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.all(7.0),
                                      width: 37.0,
                                      height: 37.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                      ),
                                      child: Center(
                                        child: Text(_value4.round().toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.black87),),
                                      )
                                  )
                                ],
                              )
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )

        ],
      ),*/
        bottomNavigationBar: Container(
          height: 80.0,
          color: Colors.transparent,
          child: Center(
            child: RaisedButton(
              child: Padding(padding: EdgeInsets.all(13.0),
                child: Text('Calcular', style: TextStyle(color: Colors.black),)
              ),
            ),
          ),
        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

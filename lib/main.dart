import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
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
  TextEditingController _controller1;
  double _value2 = 25;
  TextEditingController _controller2;
  double _value3 = 25;
  TextEditingController _controller3;
  double _value4 = 25;
  TextEditingController _controller4;
  double _valueTotal = 100;
  double _sumTotal = 100;
  Color _colorTotal = Colors.green;
  bool _showText = false;
  double _height = 12.0;

  void initState() {
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
    _controller3 = TextEditingController();
    _controller4 = TextEditingController();
    _controller1.text = _value1.round().toString();
    _controller2.text = _value2.round().toString();
    _controller3.text = _value3.round().toString();
    _controller4.text = _value4.round().toString();
  }

  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    super.dispose();
  }

  customRound(int number) {
    var sobra = number%10;
    var base = number - sobra;
    if(sobra == 1 || sobra == 2 || sobra == 3) {
      return base;
    }
    if(sobra == 4 || sobra == 5 || sobra == 6) {
      return base + 5;
    }
    if(sobra == 7 || sobra == 8 || sobra == 9) {
      return base + 10;
    }
    return base;
  }
   calculate() {
    var sum = _value1 + _value2 + _value3 + _value4;
    setState(() {
      if(sum > 100) {
        this._valueTotal = 100.0;
        this._colorTotal = Colors.red;
        this._showText = true;
        this._height = 32.0;
      } else {
        this._valueTotal = sum;
        this._colorTotal = Colors.green;
        this._showText = false;
        this._height = 12.0;
      }
      this._sumTotal = sum;
      this._controller1.text = customRound(this._value1.round()).toString();
      this._controller2.text = customRound(this._value2.round()).toString();
      this._controller3.text = customRound(this._value3.round()).toString();
      this._controller4.text = customRound(this._value4.round()).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    pinned: true,
                    floating: false,
                    snap: false,
                    bottom: PreferredSize(
                      child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Expanded(
                                      child: IgnorePointer(
                                        ignoring: true,
                                        child: SliderTheme(
                                          data: SliderTheme.of(context).copyWith(
                                            activeTrackColor: _colorTotal,
                                            inactiveTrackColor: Colors.grey[300],
                                            trackShape: RectangularSliderTrackShape(disabledThumbGapWidth: 0.0),
                                            trackHeight: 30.0,
                                            thumbShape: CustomSliderThumbCircle(
                                                thumbRadius: 0,
                                                max: 100,
                                                min: 0
                                            ),
                                          ),
                                          child: Slider(
                                            value: _valueTotal,
                                            min: 0,
                                            max: 100,
                                            divisions: 20,
                                            label: '$_valueTotal',
                                            onChanged: (value) {
                                            },
                                          ),
                                        ),
                                      )
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15.0, right: 15.0),
                                    child: Text(_sumTotal.round().toString() + " %")
                                  )
                                ],
                              ),
                              (_showText) ? Container(
                                padding: EdgeInsets.all(2.0),
                                child: Text("La suma de los 4 debe ser 100 para continaur.", style: TextStyle(color: Colors.red),),
                              ) : Container(width: 0.0, height: 0.0,)
                            ],
                          )
                      ),
                      preferredSize: Size.fromHeight(_height),
                    ),
                  )
                ];
              },
              body: Container(
                child: SafeArea(
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
                                                        calculate();
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
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    hintText: _controller1.text
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  controller: _controller1,
                                                  keyboardType: TextInputType.number,
                                                  inputFormatters: <TextInputFormatter>[
                                                    WhitelistingTextInputFormatter.digitsOnly
                                                  ],
                                                  onSubmitted: (String value) async {
                                                    setState(() {
                                                      var result = double.parse(value).roundToDouble();
                                                      this._value1 = (result > 100) ? 100 : (result < 0) ? 0 : result;
                                                    });
                                                    calculate();
                                                  },
                                                ),
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
                                                          calculate();
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
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                      hintText: _controller2.text
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  controller: _controller2,
                                                  keyboardType: TextInputType.number,
                                                  inputFormatters: <TextInputFormatter>[
                                                    WhitelistingTextInputFormatter.digitsOnly
                                                  ],
                                                  onSubmitted: (String value) async {
                                                    setState(() {
                                                      var result = double.parse(value).roundToDouble();
                                                      this._value2 = (result > 100) ? 100 : (result < 0) ? 0 : result;
                                                    });
                                                    calculate();
                                                  },
                                                ),
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
                                                          calculate();
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
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                      hintText: _controller3.text
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  controller: _controller3,
                                                  keyboardType: TextInputType.number,
                                                  inputFormatters: <TextInputFormatter>[
                                                    WhitelistingTextInputFormatter.digitsOnly
                                                  ],
                                                  onSubmitted: (String value) async {
                                                    setState(() {
                                                      var result = double.parse(value).roundToDouble();
                                                      this._value3 = (result > 100) ? 100 : (result < 0) ? 0 : result;
                                                    });
                                                    calculate();
                                                  },
                                                ),
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
                                                      calculate();
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
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                      hintText: _controller4.text
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  controller: _controller4,
                                                  keyboardType: TextInputType.number,
                                                  inputFormatters: <TextInputFormatter>[
                                                    WhitelistingTextInputFormatter.digitsOnly
                                                  ],
                                                  onSubmitted: (String value) async {
                                                    setState(() {
                                                      var result = double.parse(value).roundToDouble();
                                                      this._value4 = (result > 100) ? 100 : (result < 0) ? 0 : result;
                                                    });
                                                    calculate();
                                                  },
                                                ),
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
                    )
                ),
              )
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            child: Center(
              child: Container(
                  child: RaisedButton(
                    child: Padding(padding: EdgeInsets.all(17.0),
                        child: Text('Calcular', style: TextStyle(color: Colors.black),)
                    ),
                    onPressed: () {
                      print("Press");
                    },
                  )
              ),
            ),
            bottom: 0,
            left: 0,
            width: MediaQuery.of(context).size.width,
            //TODO antes no estaba marcada la altura
            height: MediaQuery.of(context).size.height * 0.118,
          )
        ],
      )
    );
  }
}

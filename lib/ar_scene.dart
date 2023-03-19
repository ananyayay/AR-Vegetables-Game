import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;


class ARScene extends StatefulWidget {
  const ARScene({super.key});

  @override
  State<ARScene> createState() => _ARSceneState();
}

class _ARSceneState extends State<ARScene> {
  late ArCoreController arCoreController;

  @override
  Widget build(BuildContext context) {
    // return 

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[

            SizedBox(
              height: 500.0,
              child: ArCoreView(
                onArCoreViewCreated: _onArCoreViewCreated,
                enableTapRecognizer: true,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              
              child: Container(
                
                
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[

                    SizedBox(
                      width: 20.0,
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          
                          borderRadius: BorderRadius.circular(16.0),
                          child: 
                          
                          Container(
                            height: 70.0,
                            width: 70.0,
                            color: Color(0xffFF0E58),
                            // padding: EdgeInsets.zero,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: Image.asset("assets/burger.jpg"),
                            ),
                        
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        
                        height: 80.0,
                        width: 80.0,
                        color: Color(0xffFF0E58),
                        child: IconButton(
                          onPressed: () {},
                          
                          icon: Image(
                            image: AssetImage("assets/pizza.jpg"),
                            
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.teal)
                              )
                            )
                          )
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    ClipRRect(
                      
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        
                        height: 80.0,
                        width: 80.0,
                        color: Color(0xffFF0E58),
                        child: ElevatedButton(
                          
                          onPressed: (){},
                          child: Image(
                            image: AssetImage("assets/rice_curry.jpg"),
                          ),
                          
                        ),
                    
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),

                    ElevatedButton(
                      
                      onPressed: () {} ,
                      style: ElevatedButton.styleFrom(
                        fixedSize:Size(80, 80),
                        padding:EdgeInsets.all(8),

                      ),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        
                        child: SizedBox(
                          // height: 60,
                          // width: 60,
                          child: Image(
                            image: AssetImage("assets/rice_curry.jpg"),
                            
                            ),
                        )
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    
            
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
     final material = ArCoreMaterial(color: Colors.blue);
    final sphere = ArCoreSphere(materials: [material], radius: 0.2);
    final node = ArCoreNode(
      shape: sphere,
      position: vector.Vector3(0, 0, -1),
    );
    controller.addArCoreNode(node);

  }
}
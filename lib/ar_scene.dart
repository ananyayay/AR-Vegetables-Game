import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:ar_vegetables/loading.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
    double heightScreen= MediaQuery.of(context).size.height;
    double widthScreen= MediaQuery.of(context).size.width;
    
    return Scaffold(
      
      body: Container(
        child: Stack(
          children: <Widget>[

            SizedBox(
              height: heightScreen,
              // child: ArCoreView(
              //   onArCoreViewCreated: _onArCoreViewCreated,
              //   enableTapRecognizer: true,
              // ),
              child: Container(
                color: Colors.limeAccent,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              
              child: Container(
                decoration: BoxDecoration(
                color: Colors.transparent,
                
                ),
                alignment: Alignment.bottomCenter,    
                    
                child: CarouselSlider(

                  items: [1,2,3,4,5].map((e) {
                    
                  // return Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   margin: EdgeInsets.symmetric(horizontal: 5),
                  //   decoration: BoxDecoration(color:  Colors.amber,
                  //     borderRadius: BorderRadius.circular(10)
                  //   ),
                  // width: 0.1*widthScreen,
                  //   height: 0.1*widthScreen,
                  //   child: Center(
                  //     child: Text("texttt $e",
                  //     style: TextStyle(fontSize: 40),
                  //     // style: TextStyle(fontSize: 0.07*widthScreen),
                  //     ),
                  //   ),
                  // );
                  
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    
                    margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(color:  Color.fromARGB(255, 3, 171, 154),
                      borderRadius: BorderRadius.circular(10)
                      
                    ),
                    
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),

                      child: Row(
                        children: <Widget>[
                          Container(
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                                height: 0.14*heightScreen,
                                width: 0.14*heightScreen,
                                child: Padding(
                                  padding:  EdgeInsets.all( 0.008*heightScreen ),
                          
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16.0),
                                    child: Container(
                                      
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute (builder: (context) => Loading()));
                                        },
                                        icon: Image.asset("assets/images/burger.jpg"),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        ],
                        ),
                    ),
                    
                  );

                  }).toList(),
                        options: CarouselOptions(
                          height: 0.2*heightScreen,
                          
                        ),
                        
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
    // final material = ArCoreMaterial(color: Colors.blue);
    // final sphere = ArCoreSphere(materials: [material], radius: 0.2);
    // final node = ArCoreNode(
    //   shape: sphere,
    //   position: vector.Vector3(0, 0, -1),
    // );
    var node = ArCoreReferenceNode(
      
      objectUrl: "assets/models/pizza.gltf"
      // object3DFileName: "assets/models/pizza.gltf"

    );
    controller.addArCoreNode(node);
  }

  // void _onArCoreViewCreated(ArCoreController controller) {
  //   arCoreController = controller;
    
  //   ArCoreReferenceNode node = ArCoreReferenceNode(
  //     name: 'myNode',
  //     objectUrl: "assets/models/pizza.gltf",
  //     position: vector.Vector3(0, 0, -1),
  //     scale: vector.Vector3(10, 10, 10),
  //   );

  //   arCoreController.addArCoreNode(node);

  //   _addNode();

  // }
  

  // void _addNode() {
  //   ArCoreMaterial material = ArCoreMaterial(color: Colors.amber);

  //   ArCoreSphere sphere = ArCoreSphere(
  //     materials: [material],
  //     radius: 0.1,
  //   );

  //   var node = ArCoreNode(
  //     shape: sphere,
  //     position: vector.Vector3(0, 0, -2),
  //     scale: vector.Vector3(1, 1, 1),
  //   );

  //   arCoreController.addArCoreNode(node);
  // }

}
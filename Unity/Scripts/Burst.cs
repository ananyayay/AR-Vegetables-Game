using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Burst : MonoBehaviour
{
    public GameObject burst;
    
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        //on key press, instantiate burst at the 3 units above position of the object
        if (Input.GetKeyDown(KeyCode.V))
        {
            //console out pressd v
            Debug.Log("pressed v");
            Instantiate(burst, transform.position + new Vector3(0, 3, 0), transform.rotation);
        }
    }
}

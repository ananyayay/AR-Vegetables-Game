using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class saucy : MonoBehaviour

{
    public GameObject Marinara;
    public GameObject Pesto;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        //if input is x, instantiate marinara at the position of the sauce
        if (Input.GetKeyDown(KeyCode.X))
        {
            Instantiate(Marinara, transform.position, transform.rotation);
            //destroy gameobject
            Destroy(gameObject);
            Debug.Log("pressed x");
        }

        //if input is z, instantiate pesto at the position of the sauce
        if (Input.GetKeyDown(KeyCode.Z))
        {
            Instantiate(Pesto, transform.position, transform.rotation);
            //destroy gameobject
            Destroy(gameObject);
            Debug.Log("pressed z");
        }

        
    }
}

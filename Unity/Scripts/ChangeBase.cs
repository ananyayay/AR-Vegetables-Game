using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangeBase : MonoBehaviour
{


    public GameObject thinBase;
    public GameObject blackBase;
    public GameObject normalBase;

    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.T))
        {
            //instantiate thinBase at the position of the base
            Instantiate(thinBase, transform.position, transform.rotation);
            //destroy gameobject
            Destroy(gameObject);
            Debug.Log("pressed t");
        }

        if (Input.GetKeyDown(KeyCode.B))
        {
            //instantiate thinBase at the position of the base
            Instantiate(blackBase, transform.position, transform.rotation);
            //destroy gameobject
            Destroy(gameObject);
            Debug.Log("pressed b");
        }

        if (Input.GetKeyDown(KeyCode.N))
        {
            //instantiate thinBase at the position of the base
            Instantiate(normalBase, transform.position, transform.rotation);
            //destroy gameobject
            Destroy(gameObject);
            Debug.Log("pressed n");
        }

    }
}

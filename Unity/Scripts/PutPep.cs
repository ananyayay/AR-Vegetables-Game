using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PutPep : MonoBehaviour
{

    public GameObject pep;
    public GameObject capsicum;
    public GameObject corn;
    public GameObject onion;
    public GameObject tomato;


    public bool pepActive = false;
    public bool capsicumActive = false;
    public bool cornActive = false;
    public bool onionActive = false;
    public bool tomatoActive = false;


    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {

        pep.SetActive(pepActive);
        capsicum.SetActive(capsicumActive);
        corn.SetActive(cornActive);
        onion.SetActive(onionActive);
        tomato.SetActive(tomatoActive);
   

        if (Input.GetKeyDown(KeyCode.P))
        {
            pepActive = true;
            //console out "pressed p"
            Debug.Log("pressed p");
            pep.SetActive(pepActive);
        }

        if (Input.GetKeyDown(KeyCode.C))
        {
            capsicumActive = true;
            //console out "pressed c"
            Debug.Log("pressed c");
            capsicum.SetActive(capsicumActive);
        }

        if (Input.GetKeyDown(KeyCode.O))
        {
            cornActive = true;
            //console out "pressed o"
            Debug.Log("pressed o");
            corn.SetActive(cornActive);
        }

        if (Input.GetKeyDown(KeyCode.I))
        {
            onionActive = true;
            //console out "pressed i"
            Debug.Log("pressed i");
            onion.SetActive(onionActive);
        }

        if (Input.GetKeyDown(KeyCode.M))
        {
            tomatoActive = true;
            //console out "pressed t"
            Debug.Log("pressed t");
            tomato.SetActive(tomatoActive);
        }

    }
}

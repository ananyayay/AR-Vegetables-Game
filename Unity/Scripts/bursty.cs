using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class bursty : MonoBehaviour
{

    Vector3 position;
    void Start()
    {
    }

    // Update is called once per frame
    void Update()
    {

    }

    //on collision destroy object
    void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.tag == "Player")
        {
            // Spawn a shattered object
            position = transform.position;
            Destroy(gameObject);
        }
    }

}

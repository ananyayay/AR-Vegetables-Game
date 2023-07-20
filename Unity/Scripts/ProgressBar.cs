using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


[ExecuteInEditMode()]
public class ProgressBar : MonoBehaviour
{

    public int max ;
    public int current ;

    public Image mask;  
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        GetCurrentFill();
        
    }

    // void FetchFill(){
    //     current = controller.FetchScore();
    // }

    void GetCurrentFill(){
        float fillAmount = (float) current/(float)max;
        mask.fillAmount = fillAmount;

    }
}

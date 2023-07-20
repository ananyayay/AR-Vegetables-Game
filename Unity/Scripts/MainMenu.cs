using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;


public class MainMenu : MonoBehaviour
{
    // Start is called before the first frame update

    public GameObject home;
    public GameObject menupage;
    
    
    public void invisible(){

        menupage.SetActive(true);

    }

    public void Veggies(){

        SceneManager.LoadScene("Pizza Base");

    }

    public void Nutri(){

        SceneManager.LoadScene("Nutrient");

    }
    public void Quest(){

        SceneManager.LoadScene("Recipes");

    }


}

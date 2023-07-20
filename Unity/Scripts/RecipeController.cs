using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.SceneManagement;
using System.IO;
using UnityEngine.Networking;
using System;
using System.Net.Http;
using System.Threading.Tasks;
using System.Text;

public class RecipeController : MonoBehaviour
{
    // Start is called before the first frame update

    public GameObject homePage;

    public GameObject preGame;

    public GameObject recipe1;
    public GameObject r1page1;
    public GameObject r1page2;
    public GameObject r1page3;
    public GameObject r1page4;
    public GameObject r1page5;
    
    
    public GameObject recipe2;
    public GameObject r2page1;
    public GameObject r2page2;
    public GameObject r2page3;
    public GameObject r2page4;
    public GameObject r2page5;


    public GameObject recipe3;
    
    public GameObject r3page1;
    public GameObject r3page2;
    public GameObject r3page3;
    public GameObject r3page4;
    public GameObject r3page5;



    public GameObject recipe4;
    public GameObject r4page1;
    public GameObject r4page2;
    public GameObject r4page3;
    public GameObject r4page4;
    public GameObject r4page5;



    public GameObject homeR1;
    public GameObject homeR2;
    public GameObject homeR3;
    public GameObject homeR4;
    

    void Start()
    {
        homePage.SetActive(false);

        recipe1.SetActive(false);
        recipe2.SetActive(false);
        recipe3.SetActive(false);
        recipe4.SetActive(false);

        preGame.SetActive(true);




        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void Home(){
        
        SceneManager.LoadScene("Home");

    }

    public void StartGame(){
        
        homePage.SetActive(true);

        recipe1.SetActive(false);
        recipe2.SetActive(false);
        recipe3.SetActive(false);
        recipe4.SetActive(false);

        preGame.SetActive(false);

        homeR1.SetActive(true);
        homeR2.SetActive(true);
        homeR3.SetActive(true);
        homeR4.SetActive(true);
        

    }

    

    public void Close(){
        
        homePage.SetActive(true);

        recipe1.SetActive(false);
        recipe2.SetActive(false);
        recipe3.SetActive(false);
        recipe4.SetActive(false);

        homeR1.SetActive(true);
        homeR2.SetActive(true);
        homeR3.SetActive(true);
        homeR4.SetActive(true);
        
    }

    public void Recipe1(){
        
        recipe1.SetActive(true);
        r1page1.SetActive(true);


        r1page2.SetActive(false);
        r1page3.SetActive(false);
        r1page4.SetActive(false);
        r1page5.SetActive(false);


        recipe2.SetActive(false);
        recipe3.SetActive(false);
        recipe4.SetActive(false);
        

        homeR1.SetActive(true);
        homeR2.SetActive(false);
        homeR3.SetActive(false);
        homeR4.SetActive(false);
        

    }



    public void Recipe2(){
        homeR1.SetActive(false);

        homeR2.SetActive(true);

        homeR3.SetActive(false);
        homeR4.SetActive(false);

        
        recipe2.SetActive(true);
        r2page1.SetActive(true);


        r2page2.SetActive(false);
        r2page3.SetActive(false);
        r2page4.SetActive(false);
        r2page5.SetActive(false);


        recipe1.SetActive(false);
        recipe3.SetActive(false);
        recipe4.SetActive(false);
        
    }



    public void Recipe3(){

        homeR1.SetActive(false);
        homeR2.SetActive(false);
        homeR3.SetActive(true);
        homeR4.SetActive(false);
        
        recipe3.SetActive(true);
        r3page1.SetActive(true);

        r3page2.SetActive(false);
        r3page3.SetActive(false);
        r3page4.SetActive(false);
        r3page5.SetActive(false);


        recipe2.SetActive(false);
        recipe1.SetActive(false);
        recipe4.SetActive(false);
        
        
        
        

    }



    public void Recipe4(){

         homeR1.SetActive(false);
        homeR2.SetActive(false);
        homeR3.SetActive(false);
        homeR4.SetActive(true);
        
        recipe4.SetActive(true);
        
        r4page1.SetActive(true);


        r4page2.SetActive(false);
        r4page3.SetActive(false);
        r4page4.SetActive(false);
        r4page5.SetActive(false);


        recipe2.SetActive(false);
        recipe3.SetActive(false);
        recipe1.SetActive(false);
        

       
        

    }

    public void Next2(int current){
        switch(current){
            case 1:
                r2page2.SetActive(true);
                break;
            case 2:
                r2page3.SetActive(true);
                break;
            case 3:
            //     r2page4.SetActive(true);
            //     break;
            // case 4:
                r2page5.SetActive(true);
                break;
        
            default:
            break;
        }
        
    }
    public void Next3(int current){
        switch(current){
            case 1:
                r3page2.SetActive(true);
                break;
            case 2:
            //     r3page3.SetActive(true);
            //     break;
            // case 3:
            //     r3page4.SetActive(true);
            //     break;
            // case 4:
                r3page5.SetActive(true);
                break;
        
            default:
            break;
        }
        
    }
    public void Next4(int current){
        switch(current){
            case 1:
                r4page2.SetActive(true);
                break;
            case 2:
                r4page3.SetActive(true);
                break;
            case 3:
            //     r4page4.SetActive(true);
            //     break;
            // case 4:
                r4page5.SetActive(true);
                break;
        
            default:
            break;
        }

    }
    public void Next( int current){
        switch(current){
            case 1:
                r1page2.SetActive(true);
                break;
            case 2:
                r1page3.SetActive(true);
                break;
            case 3:
                r1page4.SetActive(true);
                break;
            case 4:
                r1page5.SetActive(true);
                break;
        
            default:
            break;
        }
        

    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

using UnityEngine.SceneManagement;




public class PizzaController : MonoBehaviour
{
    
    int totalScore ;

    int increment;
    bool updateYes ;

    bool validRayCast;

    public GameObject preGamePizza;
    public GameObject hello;
    public GameObject play;

    public GameObject pizzaComponentBase;
    public GameObject pizzaComponentCheese;
    public GameObject pizzaComponentSauce;
    public GameObject pizzaComponentTopping;

    // public GameObject wheat;
    // public GameObject multigrain;

    public GameObject cheeseBursty;
    public GameObject pestoPrefab;
    public GameObject marinaraPrefab;
    public GameObject onion;
    public GameObject capsicum;
    public GameObject tomato;
    public GameObject corn;

    public AudioSource sourceWheat;
    public AudioSource sourceMultigrain;
    public AudioSource sourceCheese;
    public AudioSource sourceMarinara;
    public AudioSource sourcePesto;
    public AudioSource sourceCapsicum;
    public AudioSource sourceCorn;
    public AudioSource sourceTomato;
    public AudioSource sourceOnion;
    
    public AudioClip clipWheat;
    public AudioClip clipMultigrain;
    public AudioClip clipCheese;
    public AudioClip clipMarinara;
    public AudioClip clipPesto;
    public AudioClip clipCapsicum;
    public AudioClip clipCorn;
    public AudioClip clipTomato;
    public AudioClip clipOnion;
    

    public GameObject thinBase;
    public GameObject blackBase;
    public GameObject normalBase;

    

    public GameObject resultsContinue;

    public GameObject mainCanvas;
    public GameObject resultsCanvas;

    public GameObject resultsPage;
    public GameObject spidermanMuscular;

    public GameObject score;
    public TextMeshProUGUI scoreText;
    

    public bool wheatClicked;

    public bool multigrainClicked;
    public bool cheeseBurstClicked;

    public bool cheeseRegularClicked;
    public bool marinaraClicked;

    public bool pestoClicked;
    public bool capsicumClicked;

    public bool onionClicked;
    public bool tomatoClicked;

    public bool cornClicked;


    public GameObject confirm;

    public GameObject confirmCheese;

    public GameObject confirmSauce;
    public GameObject confirmTopping;

    public GameObject wheatPopup;
    public GameObject multigrainPopup;
    public GameObject cheesePopup;

    public GameObject marinaraPopup;
    public GameObject pestoPopup;

    public GameObject capsicumPopup;
    public GameObject cornPopup;
    public GameObject tomatoPopup;
    public GameObject onionPopup;

    public GameObject phase1;
    public GameObject phase2;
    public GameObject phase3;
    public GameObject phase4;
    public GameObject phase5;

    void Start()
    {
        Screen.orientation = ScreenOrientation.Portrait;

        wheatClicked = false;
        multigrainClicked = false;
        
        normalBase.SetActive(true);
        blackBase.SetActive(false);
        
        
        totalScore = 0;
        increment = 0;
        updateYes = false;

        mainCanvas.SetActive(false);
        resultsCanvas.SetActive(false);

        preGamePizza.SetActive(true);
        hello.SetActive(true);
        play.SetActive(false);

        pizzaComponentBase.SetActive(false);
        pizzaComponentCheese.SetActive(false);
        pizzaComponentSauce.SetActive(false);
        pizzaComponentTopping.SetActive(false);
        resultsContinue.SetActive(false);
        
    }

    void Update()
    {

        if(increment == 0) 
        updateYes = false;
        
        if(updateYes && increment>0){

            totalScore +=1;
            scoreText.text = totalScore.ToString();
            increment--;

        }

        else if(updateYes && increment<0){

            totalScore -=1;
            scoreText.text = totalScore.ToString();
            increment++;

        }
        // for(int i=0; i<increment; i++){

        // Debug.Log(updateYes);
        // Debug.Log(totalScore);

        if (Input.touchCount > 0 && Input.GetTouch(0).phase == TouchPhase.Ended )
        {
            Pickup();
        }

        if(wheatClicked || multigrainClicked){
            confirm.SetActive(true);
        }

        if( !wheatClicked && !multigrainClicked){
            confirm.SetActive(false);
        }

        if(cheeseBurstClicked || cheeseRegularClicked){
            confirmCheese.SetActive(true);
        }

        if( !cheeseBurstClicked && !cheeseRegularClicked){
            confirmCheese.SetActive(false);
        }

        if(pestoClicked || marinaraClicked){
            confirmSauce.SetActive(true);
        }

        if( !pestoClicked && !marinaraClicked){
            confirmSauce.SetActive(false);
        }

        if(onionClicked || tomatoClicked || cornClicked || capsicumClicked){
            confirmTopping.SetActive(true);
        }

        if( !onionClicked && !multigrainClicked && !cornClicked && !capsicumClicked){
            confirmTopping.SetActive(false);
        }
        
        // 0 - 30  =  30 - 50 = 50 - 80 = 80 - 100 = 100 - 130

        if(totalScore <= 0){
            phase1.SetActive(false); 
            phase2.SetActive(false);
            phase3.SetActive(false);
            phase4.SetActive(false);
            phase5.SetActive(false);
        }
        
        if(totalScore >= 0 && totalScore<=30){
            phase1.SetActive(false); 
            phase2.SetActive(false);
            phase3.SetActive(false);
            phase4.SetActive(false);
            phase5.SetActive(false);
        }
        if(totalScore>= 31 && totalScore <= 50){
            phase1.SetActive(true); 
            phase2.SetActive(true);
            phase3.SetActive(false);
            phase4.SetActive(false);
            phase5.SetActive(false);
        }
        if(totalScore>=51 && totalScore<=80 ){
            phase1.SetActive(true); 
            phase2.SetActive(true);
            phase3.SetActive(true);
            phase4.SetActive(false);
            phase5.SetActive(false);
        }
        if(totalScore>=81 && totalScore<=100){
            phase1.SetActive(true); 
            phase2.SetActive(true);
            phase3.SetActive(true);
            phase4.SetActive(true);
            phase5.SetActive(false);
        }
        if(totalScore>=101 && totalScore<=130){
            phase1.SetActive(true); 
            phase2.SetActive(true);
            phase3.SetActive(true);
            phase4.SetActive(true);
            phase5.SetActive(true);
        }

    }

    void UpdateScore(){
        // scoreText.text = totalScore.ToString();
        updateYes = true;
        
    }
    
    public void IncreaseScore(int num){
        // totalScore += num;
        increment = num;
        UpdateScore();
    }

    public void DecreaseScore(int num){
        // totalScore += num;
        increment = (-1)*num;
        UpdateScore();
    }

    public void Next(){
        hello.SetActive(false);
        play.SetActive(true);
    }

    public void Play(){
        play.SetActive(false);
        preGamePizza.SetActive(false);

        mainCanvas.SetActive(true);
        pizzaComponentBase.SetActive(true);

    }

    public void Testing(){
        onion.SetActive(true);

        Instantiate(thinBase, transform.position, transform.rotation);
            //destroy gameobject
            Destroy(gameObject);
            Debug.Log("pressed t");
    }

    public void BaseSelected(){

        pizzaComponentBase.SetActive(false);
        pizzaComponentCheese.SetActive(true);

    }

    public void CheeseSelected(){

        pizzaComponentCheese.SetActive(false);
        pizzaComponentSauce.SetActive(true);

    }
    
    public void SauceSelected(){

        pizzaComponentSauce.SetActive(false);
        pizzaComponentTopping.SetActive(true);

    }


    public void ToppingSelected(){

        pizzaComponentTopping.SetActive(false);
        resultsContinue.SetActive(true);
        

    }

    
    public void SeePizza(){
        mainCanvas.SetActive(false);
        resultsCanvas.SetActive(true);
    }

    public void SeeResults(){
        resultsPage.SetActive(false);
        spidermanMuscular.SetActive(true);

    }
    
    public void Home(){
        
        spidermanMuscular.SetActive(true);
        SceneManager.LoadScene("Home");

    }
    
    public void PlayAgain(){
        
        SceneManager.LoadScene("Pizza Base");
        

    }
    

    private void Pickup()
    {
        
        Ray ray = Camera.current.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;

        if (Physics.Raycast(ray, out hit, Mathf.Infinity))
        {
            if(hit.collider.gameObject.name == "Wheat" ){
                if(wheatClicked){
                    DecreaseScore(-10);
                    
                    wheatClicked = false;
                }
                else{
                    IncreaseScore(-10);
                    wheatPopup.SetActive(true);
                    wheatClicked = true;
                }
            }

            if(hit.collider.gameObject.name == "multigrain"){
                
                if(multigrainClicked){
                    DecreaseScore(20);
                    
                    blackBase.SetActive(false);
                    normalBase.SetActive(true);

                    multigrainClicked = false;
                }
                else{
                    IncreaseScore(20);

                    normalBase.SetActive(false);
                    blackBase.SetActive(true);

                    multigrainPopup.SetActive(true);

                    multigrainClicked = true;
                }

            }

            if(hit.collider.gameObject.name == "Cheese Burst" ){
                if(cheeseBurstClicked){
                    DecreaseScore(-20);
                    cheeseBurstClicked = false;
                    cheeseBursty.SetActive(false);
                }
                else{
                    IncreaseScore(-20);
                    cheesePopup.SetActive(true);
                    cheeseBursty.SetActive(true);
                    cheesePopup.SetActive(true);
                    cheeseBurstClicked = true;
                }
            }

            if(hit.collider.gameObject.name == "Cheese Regular" ){
                if(cheeseRegularClicked){
                    DecreaseScore(10);
                    cheeseRegularClicked = false;
                    cheeseBursty.SetActive(false);
                }
                else{
                    IncreaseScore(10);
                    cheeseBursty.SetActive(true);
                    cheeseRegularClicked = true;
                }
            }

            if(hit.collider.gameObject.name == "pesto" ){
                if(pestoClicked){
                    DecreaseScore(10);
                    pestoClicked = false;
                    pestoPrefab.SetActive(false);
                }
                else{
                    IncreaseScore(10);
                    pestoPrefab.SetActive(true);
                    multigrainPopup.SetActive(true);
                    pestoPopup.SetActive(true);
                    pestoClicked = true;
                }
            }

            if(hit.collider.gameObject.name == "ketchup" ){
                if(marinaraClicked){
                    DecreaseScore(20);
                    marinaraClicked = false;
                    marinaraPrefab.SetActive(false);
                }
                else{
                    IncreaseScore(20);
                    marinaraPopup.SetActive(true);
                    marinaraPrefab.SetActive(true);
                    marinaraPopup.SetActive(true);
                    marinaraClicked = true;
                }
            }            

            if(hit.collider.gameObject.name == "onion prefab" ){
                if(onionClicked){
                    DecreaseScore(20);
                    onionClicked = false;
                    onion.SetActive(false);
                }
                else{
                    IncreaseScore(20);
                    onion.SetActive(true);
                    onionPopup.SetActive(true);
                    onionClicked = true;
                }
            }
            if(hit.collider.gameObject.name == "tomato prefab" ){
                if(tomatoClicked){
                    DecreaseScore(20);
                    tomatoClicked = false;
                    tomato.SetActive(false);
                }
                else{
                    IncreaseScore(20);
                    tomato.SetActive(true);
                    tomatoPopup.SetActive(true);
                    tomatoClicked = true;
                }
            }

            if(hit.collider.gameObject.name == "capsicum prefab" ){
                if(capsicumClicked){
                    DecreaseScore(20);
                    capsicumClicked = false;
                    capsicum.SetActive(false);
                }
                else{
                    IncreaseScore(20);
                    capsicum.SetActive(true);
                    capsicumPopup.SetActive(true);
                    capsicumClicked = true;
                }
            }

            if(hit.collider.gameObject.name == "corn prefab" ){
                if(cornClicked){
                    DecreaseScore(20);
                    cornClicked = false;
                    corn.SetActive(false);
                }
                else{
                    IncreaseScore(20);
                    corn.SetActive(true);
                    cornPopup.SetActive(true);
                    cornClicked = true;
                }
            }

            if(hit.collider.gameObject.name == "testing"){
                IncreaseScore(50);

            }
        }
        else
        {
            return;
        }

    }

    public void Confirm(string phase){
        switch(phase){
            case "base":
                pizzaComponentBase.SetActive(false);
                pizzaComponentSauce.SetActive(true);

                
            break;

             case "sauce":
                pizzaComponentSauce.SetActive(false);                
                pizzaComponentCheese.SetActive(true);
                break;

            case "cheese":
                pizzaComponentCheese.SetActive(false);
                pizzaComponentTopping.SetActive(true);
                
            break;
            
            case "topping":
                pizzaComponentTopping.SetActive(false);
                resultsContinue.SetActive(true);
                
            break;

           

            default:
            break;

        }
    }

    public void crossWheatPopup(){
        wheatPopup.SetActive(false);
    }
    public void crossMultigrainPopup(){
        multigrainPopup.SetActive(false);
    }
    public void crossMarinaraPopup(){
        marinaraPopup.SetActive(false);
    }
    public void crossPestoPopup(){
        pestoPopup.SetActive(false);
    }
    public void crossCheesePopup(){
        cheesePopup.SetActive(false);
    }
    public void crossCapsicumPopup(){
        capsicumPopup.SetActive(false);
    }
    public void crossTomatoPopup(){
        tomatoPopup.SetActive(false);
    }
    public void crossOnionPopup(){
        onionPopup.SetActive(false);
    }
    public void crossCornPopup(){
        cornPopup.SetActive(false);
    }
    


    public void wheatAudio(){
        sourceWheat.PlayOneShot(clipWheat);
    }
    public void multigrainAudio(){
        sourceMultigrain.PlayOneShot(clipMultigrain);
    }
    public void cheeseAudio(){
        sourceCheese.PlayOneShot(clipCheese);
    }
    public void marinaraAudio(){
        sourceMarinara.PlayOneShot(clipMarinara);
    }
    public void pestoAudio(){
        sourcePesto.PlayOneShot(clipPesto);
    }
    public void cornAudio(){
        sourceCorn.PlayOneShot(clipCorn);
    }
    public void onionAudio(){
        sourceOnion.PlayOneShot(clipOnion);
    }
    public void capsicumAudio(){
        sourceCapsicum.PlayOneShot(clipCapsicum);
    }
    public void tomatoAudio(){
        sourceTomato.PlayOneShot(clipTomato);
    }



    
}

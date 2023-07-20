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
// using System.Text.Json;




public class NutrientController : MonoBehaviour
{
    // Start is called before the first frame update


    double scoreGlobal ;
    int fatStarsNumber;
    int saturatedFatStarsNumber;
    int sugarStarsNumber;
    int saltStarsNumber;
    static int index = -1;

    public GameObject fatStar0;
    public GameObject fatStar1;
    public GameObject fatStar2;
    public GameObject fatStar3;
    public GameObject fatStar4;
    public GameObject fatStar5;
    
    public GameObject fatSStar0;
    public GameObject fatSStar1;
    public GameObject fatSStar2;
    public GameObject fatSStar3;
    public GameObject fatSStar4;
    public GameObject fatSStar5;

    public GameObject sugarStar0;
    public GameObject sugarStar1;
    public GameObject sugarStar2;
    public GameObject sugarStar3;
    public GameObject sugarStar4;
    public GameObject sugarStar5;
    public GameObject saltStar0;
    public GameObject saltStar1;
    public GameObject saltStar2;
    public GameObject saltStar3;
    public GameObject saltStar4;
    public GameObject saltStar5;
            

    double dishScore ;

    public TextMeshProUGUI dishScoreText;
    public TextMeshProUGUI checkFilePath;
    string checkingFilePath;
    

    public GameObject preGame;
    public GameObject hello;
    public GameObject play;

    public GameObject mainCanvas;

    public GameObject capturePage;
    public GameObject continuePage;
    public GameObject barsPage;

    public TextMeshProUGUI fatNumber;
    public TextMeshProUGUI sfatNumber;
    public TextMeshProUGUI sugarNumber;
    public TextMeshProUGUI saltNumber;
    

    public GameObject emojiPages;


    public GameObject emojiPage1;
    public GameObject emojiPage2;
    public GameObject emojiPage3;
    public GameObject emojiPage4;
    public GameObject emojiPage5;
    public GameObject starsPage;
    public bool capture = false;


    public class Nutrition
    {
        public List<string> Carbohydrate ;
        public List<string> EnergyOrCalories ;
        public List<string> Fat ;
        public List<string> Protein ;
        public List<string> ServingSizeAmount ;
        public List<string> Sodium ;
        public List<string> Sugar ;
    }
    public class Stars{
        public int fatStars {get; set;}
        public int saturatedFatStars {get; set;}
        public int sugarStars {get; set;}
        public int saltStars {get; set;}

    }

     void Start()
    {
        dishScore =0;

        preGame.SetActive(true);
        mainCanvas.SetActive(false);

        barsPage.SetActive(false);
        starsPage.SetActive(false);
        emojiPages.SetActive(false);
        continuePage.SetActive(false);


        emojiPage1.SetActive(false);
        emojiPage2.SetActive(false);
        emojiPage3.SetActive(false);
        emojiPage4.SetActive(false);
        emojiPage5.SetActive(false);
        
                // mainCanvas.SetActive(false);

        fatStarsNumber = 0;
        saturatedFatStarsNumber = 0;
        sugarStarsNumber = 0;
        saltStarsNumber = 0;



    }

    // Update is called once per frame
    async void Update()
    {
        if (capture){
            capture = false;
            capturePage.SetActive(false);

            continuePage.SetActive(true);
            // mainfunction("Galaxy A50/Android/data/com.DefaultCompany.VeggieVoyage/files/SomeLevel.jpeg");
            // mainfunction("SomeLevel.jpg");

            calculate();
            // double score = calculate();



        }

        
    }


    public Stars criteria(Nutrition response){
            Stars answer = new Stars();
            Debug.Log(response.Fat);

            Debug.Log("response");

            if (Convert.ToDouble(response.Fat[0]) <= 3) answer.fatStars = 5;
            else if (Convert.ToDouble(response.Fat[0]) > 3 && Convert.ToDouble(response.Fat[0]) <= 8) answer.fatStars = 4;
            else if (Convert.ToDouble(response.Fat[0]) > 8 && Convert.ToDouble(response.Fat[0]) <= 12) answer.fatStars = 3;
            else if (Convert.ToDouble(response.Fat[0]) > 12 && Convert.ToDouble(response.Fat[0]) <= 17 ) answer.fatStars = 2;
            else answer.fatStars = 0;

            if (Convert.ToDouble(response.Protein[0]) <= 3) answer.saturatedFatStars = 5;
            else if (Convert.ToDouble(response.Protein[0]) > 3 && Convert.ToDouble(response.Protein[0]) <= 5) answer.saturatedFatStars = 4;
            else if (Convert.ToDouble(response.Protein[0]) > 5 && Convert.ToDouble(response.Protein[0]) <= 7) answer.saturatedFatStars = 3;
            else if (Convert.ToDouble(response.Protein[0]) > 7 && Convert.ToDouble(response.Protein[0]) <= 9) answer.saturatedFatStars = 2;
            else answer.saturatedFatStars = 0;

            if (Convert.ToDouble(response.Sugar[0]) <= 5) answer.sugarStars = 5;
            else if (Convert.ToDouble(response.Sugar[0]) > 5 && Convert.ToDouble(response.Sugar[0]) <= 9) answer.sugarStars = 4;
            else if (Convert.ToDouble(response.Sugar[0]) > 9 && Convert.ToDouble(response.Sugar[0]) <= 14) answer.sugarStars = 3;
            else if (Convert.ToDouble(response.Sugar[0]) > 14 && Convert.ToDouble(response.Sugar[0]) <= 19) answer.sugarStars = 2;
            else answer.sugarStars = 0;

            if (Convert.ToDouble(response.Sodium[0]) <= 0.2) answer.saltStars = 5;
            else if (Convert.ToDouble(response.Sodium[0]) >0.2 && Convert.ToDouble(response.Sodium[0]) <=0.4) answer.saltStars = 4;
            else if (Convert.ToDouble(response.Sodium[0]) >0.4 && Convert.ToDouble(response.Sodium[0]) <=0.7) answer.saltStars = 3;
            else if (Convert.ToDouble(response.Sodium[0]) >0.7 && Convert.ToDouble(response.Sodium[0]) <=1.2) answer.saltStars = 2;
            else answer.saltStars = 0;


            return answer;

        }

        public double calculate(string json = "{\"Carbohydrate\":[\"55.2\"],\"EnergyOrCalories\":[\"558\"],\"Fat\":[\"30.0\"],\"Protein\":[\"6.89\"],\"Serving Size Amount\":[\"558\"],\"Sodium\":[\"0.892\"],\"Sugar\":[\"1.0\"]}") {
        
            index += 1;
            if (index == 3) index = 0;
            string[] jsonArray = {"{\"Carbohydrate\":[\"55.2\"],\"EnergyOrCalories\":[\"558\"],\"Fat\":[\"30.0\"],\"Protein\":[\"6.89\"],\"Serving Size Amount\":[\"558\"],\"Sodium\":[\"0.892\"],\"Sugar\":[\"1.0\"]}",
            "{\"Carbohydrate\":[\"52\"],\"EnergyOrCalories\":[\"246\"],\"Fat\":[\"1.88\"],\"Protein\":[\"8.4\"],\"Serving Size Amount\":[\"8\"],\"Sodium\":[\"0.582\"],\"Sugar\":[\"1.99\"]}",
            "{\"Carbohydrate\":[\"4.7\"],\"EnergyOrCalories\":[\"59\"],\"Fat\":[\"2.1\"],\"Protein\":[\"2.1\"],\"Serving Size Amount\":[\"300\"],\"Sodium\":[\"0.127\"],\"Sugar\":[\"0.0\"]}"};

            
            Nutrition response = JsonUtility.FromJson<Nutrition>(jsonArray[index]);

            // Nutrition response = JsonUtility.FromJson<Nutrition>(json);


            Debug.Log(response);

            saltNumber.text = response.Sodium[0];
            sugarNumber.text = response.Sugar[0];
            fatNumber.text = response.Fat[0];
            sfatNumber.text = response.Protein[0];

            Stars answer  = criteria(response);

            fatStarsNumber = answer.fatStars;
            saturatedFatStarsNumber = answer.saturatedFatStars;
            sugarStarsNumber = answer.sugarStars;
            saltStarsNumber = answer.saltStars;

          
            
            double score = 0;
            score += 0.4 * answer.saltStars;
            score += 0.4 * answer.sugarStars;
            score += 0.4 * answer.fatStars;
            score += 0.4 * answer.saturatedFatStars;
            
            
            PlotBars();
            scoreGlobal = score;

            return score;
        }

    public void FatPlotStars(){
        starsPage.SetActive(true);
        
    }  
    public void PlotEmoji(){ 

        emojiPages.SetActive(true);
        
        if(scoreGlobal<=1){
            emojiPage5.SetActive(true);
        }

        else if(scoreGlobal>1 && scoreGlobal<=3){
            emojiPage4.SetActive(true);
        }

        else if(scoreGlobal>3 && scoreGlobal<=5){
            emojiPage3.SetActive(true);
        }

        else if(scoreGlobal>5 && scoreGlobal<=7){
            emojiPage2.SetActive(true);
        }

        else if(scoreGlobal>=8){
            emojiPage1.SetActive(true);
        }

        else{
            emojiPage2.SetActive(true);
        }

    }   

    public void PlotBars(){
        switch(fatStarsNumber) 
        {
        case 0:
            // code block
            fatStar5.SetActive(true);
            break;
        case 1:
            // code block
            fatStar4.SetActive(true);
            break;
        case 2:
            // code block
            fatStar3.SetActive(true);
            break;
        case 3:
            // code block
            fatStar2.SetActive(true);
            break;
        case 4:
            // code block
            fatStar1.SetActive(true);
            break;
        case 5:
            // code block
            fatStar0.SetActive(true);
            break;
        default:
            // code block
            fatStar0.SetActive(true);
            break;
        }

        switch(saturatedFatStarsNumber) 
        {
        case 0:
            // code block
            fatSStar5.SetActive(true);
            break;
        case 1:
            // code block
            fatSStar4.SetActive(true);
            break;
        case 2:
            // code block
            fatSStar3.SetActive(true);
            break;
        case 3:
            // code block
            fatSStar2.SetActive(true);
            break;
        case 4:
            // code block
            fatSStar1.SetActive(true);
            break;
        case 5:
            // code block
            fatSStar0.SetActive(true);
            break;
        default:
            // code block
            fatSStar0.SetActive(true);
            break;
        }

        switch(sugarStarsNumber) 
        {
        case 0:
            // code block
            sugarStar5.SetActive(true);
            break;
        case 1:
            // code block
            sugarStar4.SetActive(true);
            break;
        case 2:
            // code block
            sugarStar3.SetActive(true);
            break;
        case 3:
            // code block
            sugarStar2.SetActive(true);
            break;
        case 4:
            // code block
            sugarStar1.SetActive(true);
            break;
        case 5:
            // code block
            sugarStar0.SetActive(true);
            break;
        default:
            // code block
            fatSStar0.SetActive(true);
            break;
        }

        switch(saltStarsNumber) 
        {
        case 0:
            // code block
            saltStar5.SetActive(true);
            break;
        case 1:
            // code block
            saltStar4.SetActive(true);
            break;
        case 2:
            // code block
            saltStar3.SetActive(true);
            break;
        case 3:
            // code block
            saltStar2.SetActive(true);
            break;
        case 4:
            // code block
            saltStar1.SetActive(true);
            break;
        case 5:
            // code block
            saltStar0.SetActive(true);
            break;
        default:
            // code block
            fatSStar0.SetActive(true);
            break;
        }

    }

    public async Task mainfunction(string filepath)
        {
        
        // string url = "https://nutrition.deep.moe/upload";
        string url = "https://35.234.50.137:5000";
        
        string path_img = Path.Combine( Application.persistentDataPath, filepath);
       

        try{
            using (var client = new HttpClient())
        {
            using (var content = new MultipartFormDataContent())
            {
                dishScoreText.text = "Inside main";

                using (var imageStream = new FileStream(path_img, FileMode.Open))
                {
                    dishScoreText.text = "Inside FileStream";
                    var imageContent = new StreamContent(imageStream);
                    var name_img = Path.GetFileName(path_img);

                    content.Add(imageContent, "image", name_img);
                    

                    var response = await client.PostAsync(url, content);
                    // dishScoreText.text = "After Request";
                    if (response.IsSuccessStatusCode)
                    {
                        dishScoreText.text = "success";

                        var responseContent = await response.Content.ReadAsStringAsync();
                        Console.WriteLine(responseContent.Substring(20,145));
                        double score = calculate(responseContent.Substring(20,145));
                        

                        Console.WriteLine(score);
                        dishScoreText.text = score.ToString();
                    }
                    else
                    {
                        dishScoreText.text = response.StatusCode.ToString();

                        Console.WriteLine($"Request failed with status code {response.StatusCode}");
                        double score = calculate();

                        
                        //  dishScoreText.text = score.ToString();
                        Console.WriteLine(score);
                        Console.WriteLine("Calculate called in error");
                    }
                }
            }
        }
        }
        catch (Exception e){
            dishScoreText.text = "Inside catch";

            calculate();
        }
    }

   

 public void check1(){
        checkFilePath.text = "here check 1";
    }

    public void check2(){
        checkFilePath.text = "check 22222222222";
    }

    

    public void checkFinal(){
        checkFilePath.text = checkingFilePath;

    }

    public void CaptureTry(){
        
        checkFilePath.text = "capture clicked";

        ScreenCapture.CaptureScreenshot("SomeLevel.jpg");  

        capture = true;
    }


    public void Home(){
        
        SceneManager.LoadScene("Home");

    }

    public void StartGame(){
        preGame.SetActive(false);
        mainCanvas.SetActive(true);
        capturePage.SetActive(true);

        

    }

    public void Capture(){
        
        StartCoroutine(TakeSSAndShare());
        
    }

    public void Continue(){
        
        continuePage.SetActive(false);
        barsPage.SetActive(true);   
        
    }



    public void Close(){
        
        starsPage.SetActive(false);
        
        
    }

    public void finalContinue(){
        
        starsPage.SetActive(false);
        
    }

    public void PlayAgain(){
        
        SceneManager.LoadScene("Nutrient");
        

    }
    

    private IEnumerator TakeSSAndShare(){

        string timeStamp = System.DateTime.Now.ToString("dd-MM-yyyy-HH-mm-ss");
        yield return new WaitForEndOfFrame();

        Texture2D ss = new Texture2D(Screen.width, Screen.height, TextureFormat.RGB24, false);

        ss.ReadPixels(new Rect(0,0, Screen.width, Screen.height), 0, 0);
        ss.Apply();

        string filePath = "SS here" + GetAndroidExternalStoragePath();

        // string filePath = Path.Combine(Application.persistentDataPath, "here" + timeStamp + ".png");

        File.WriteAllBytes(filePath, ss.EncodeToPNG());

        checkingFilePath = filePath;


        checkingFilePathFN();

        Destroy(ss);

        Debug.Log(ss);
        Debug.Log("${filePath}");
        Debug.Log(timeStamp);
        Debug.Log("done here");

        capture = true;


    }

    private string GetAndroidExternalStoragePath(){

        if(Application.platform != RuntimePlatform.Android)
        return Application.persistentDataPath;

        var jc = new AndroidJavaClass("android.os.Environment");

        var path = jc.CallStatic<AndroidJavaObject>("getExternalStoragePublicDirectory",
        jc.GetStatic<string>("DIRECTORY_DCIM")).Call<string>("getAbsolutePath");
        
        return path;

    }

    public void checkingFilePathFN(){
        checkFilePath.text = checkingFilePath ;
    }
    IEnumerator GetRequest(string uri){
        using(UnityWebRequest webRequest = UnityWebRequest.Get(uri)){
            yield return webRequest.SendWebRequest();

            if(webRequest.isNetworkError){
                Debug.Log(webRequest.error);
            }
            else
            {
                Debug.Log(webRequest.downloadHandler.text);
            }
        }

    }

    // public IEnumerator WaitingFn(){
    //     yeild return new WaitForSeconds(6);
    // }

    



    


}



const URL = 'https://www.poparide.com/travel/from/winnipeg-mb?origin=ChIJESsa-ftz6lIRZMq5xvoaKis';

async function scrape(){
    let res = await fetch(URL);
    let parser = new DOMParser();
    let doc = parser.parseFromString(await res.text(),'text/html');
    let details = doc.querySelectorAll('.trip-item-details');
    let data  = [];

    for(const item of details){
        data.push(item.innerText.split('\n').map(E=>E.trim()).filter(E=>E!=""));
    }


    console.log(data);
}
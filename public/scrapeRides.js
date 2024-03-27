const URL = 'https://www.poparide.com/travel/from/winnipeg-mb?origin=ChIJESsa-ftz6lIRZMq5xvoaKis';
const PAGES = 10;


async function scrape() {
    let data = [];
    for (let i = 1; i <= PAGES; i++) {

        let res = await fetch(URL + `&p=${i}`);
        let parser = new DOMParser();
        let doc = parser.parseFromString(await res.text(), 'text/html');
        let details = doc.querySelectorAll('.trip-item-details');

        for (const item of details) {
            const filtered = item.innerText.split('\n').map(E => E.trim().replaceAll(',',' ')).filter(E => E != "");
            data.push([filtered[0],filtered[2],filtered[filtered.length-1]].join(','));
        }

    }

    var dataUri = "data:text/plain;base64," + btoa(data.join('\n'));

    console.log(data);
    let a = document.createElement('a');
    a.innerText = 'Copy file link';
    a.href = dataUri;
    a.onclick = ()=>{
        navigator.clipboard.writeText(dataUri);
        alert('file link copied')
    }
    document.getElementsByTagName('main')[0].appendChild(a);
}
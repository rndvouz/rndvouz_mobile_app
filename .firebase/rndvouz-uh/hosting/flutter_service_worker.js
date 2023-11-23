'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "a29e30cd5d6180d3723927d64905dd0a",
"index.html": "7400e53ecc9e9e5b3d80ec0db86f2159",
"/": "7400e53ecc9e9e5b3d80ec0db86f2159",
"main.dart.js": "aa6faf26ddcabd36d5f4e860556a9697",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "3fc29f9294b755bca0378065b89e216e",
"assets/AssetManifest.json": "3506c9f0804e85a4db474694182f1257",
"assets/NOTICES": "7abec4413fa62e7a276ed701f730925b",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "6ebdf190210f08acea0244330150f913",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e14d4247c0221552f79bf5629127cff4",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.bin": "a59e6ee2ce615d6c22988f6ff16dffab",
"assets/fonts/MaterialIcons-Regular.otf": "0a645244a789a878a2a4aa5f437e7c8e",
"assets/assets/images/8.jpg": "3583fe17cbe41c6ebfc931ebb4cfb59e",
"assets/assets/images/9.jpg": "f88b2cecc83647bbeff9ea1a9348527c",
"assets/assets/images/14.jpg": "a0ba7b7570c1f4bd879a4e4afb16914e",
"assets/assets/images/28.jpg": "c45b1e9fd0ee04220f295399868064c6",
"assets/assets/images/29.jpg": "8d1e3b186bee529b9eacda9873f3b967",
"assets/assets/images/15.jpg": "74808ca5f38d76a9fc738f37934529a7",
"assets/assets/images/17.jpg": "b49b37abd906f8cbdea68a502c84f71a",
"assets/assets/images/16.jpg": "21ad64449cd6cdf00998fbe3a1b0b30c",
"assets/assets/images/12.jpg": "fc6f26a107a05e2e2e38a9d617f0ebdc",
"assets/assets/images/13.jpg": "12be2d5609489d5c8fd5c18f10b3a3f6",
"assets/assets/images/39.jpg": "1cf72eb5417e8801427e0cf435907b53",
"assets/assets/images/11.jpg": "f3a594ddee20913978d29bfa2f96d58d",
"assets/assets/images/10.jpg": "fb760d4813779ce0c3faf5c350c8c6b3",
"assets/assets/images/38.jpg": "fd28d0fbcfac887d6f9d4b66533363a2",
"assets/assets/images/21.jpg": "01ab3e79350b32360b3b403b67e9ae39",
"assets/assets/images/35.jpg": "8d393acf358f43b757f3b332b5652961",
"assets/assets/images/34.jpg": "0193e6b594cfd07352fad76038af707e",
"assets/assets/images/20.jpg": "98dfa5255d02070d9cc5fa9f92e75d92",
"assets/assets/images/36.jpg": "d523145948636c31b337fd22144f41cb",
"assets/assets/images/22.jpg": "b37bd63c7facc65d6439c7e86239d88f",
"assets/assets/images/23.jpg": "601d7b6bdafcab91f89b6d4f287c6761",
"assets/assets/images/37.jpg": "7c8e584309b1f2ec48271bfd37425dc0",
"assets/assets/images/33.jpg": "bd5bbc8e6549fd28155e9f8b1ed86686",
"assets/assets/images/27.jpg": "b293ad491f2ac4b6ade0646f37ac0f73",
"assets/assets/images/26.jpg": "1c84e8e021405e8dff6f49336c8f8fa7",
"assets/assets/images/32.jpg": "6c83724775450b164b658203cce96a59",
"assets/assets/images/18.jpg": "cd20248d1fe3c2fb59010f775eb6309e",
"assets/assets/images/24.jpg": "4c3fdc53ce9a73e609f44711bf593cdb",
"assets/assets/images/30.jpg": "b5cdc2cf130dd0565badaad204b167dc",
"assets/assets/images/31.jpg": "bdc1b8d21e3df121e12655affd3e3b1e",
"assets/assets/images/25.jpg": "0e09a73986499e33ad4758e673dc5a7e",
"assets/assets/images/19.jpg": "2a3c437fbf14b368674d252d5ead7a13",
"assets/assets/images/4.jpg": "1b9e4c872629847e9b81e1a256d5d5af",
"assets/assets/images/5.jpg": "a5238d31913476cbed62224dcd27fb38",
"assets/assets/images/7.jpg": "1e82fb3189e1367eec586be61b555907",
"assets/assets/images/6.jpg": "62d385d3571a87f86d4ded5b82e1cebf",
"assets/assets/images/2.jpg": "7a51bff1f4aa7e6875f330154569cdf8",
"assets/assets/images/3.jpg": "9472ba9166bfff51877d75b843d10652",
"assets/assets/images/1.jpg": "c3581097f26cbf459209a53708c2640a",
"assets/assets/images/0.jpg": "fc97eab8e31d77c0f580f73bd3ec9896",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "4124c42a73efa7eb886d3400a1ed7a06",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "f87e541501c96012c252942b6b75d1ea",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "64edb91684bdb3b879812ba2e48dd487",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}

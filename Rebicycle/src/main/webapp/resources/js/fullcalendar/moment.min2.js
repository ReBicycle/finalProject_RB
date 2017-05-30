//! moment.js
//! version : 2.18.1
//! authors : Tim Wood, Iskren Chernev, Moment.js contributors
//! license : MIT
//! momentjs.com
//!function(a,b){"object"==typeof exports&&"undefined"!=typeof module?module.exports=b():"function"==typeof define&&define.amd?define(b):a.moment=b()}(this,function(){"use strict";function a(){return sd.apply(null,arguments)}function b(a){sd=a}function c(a){return a instanceof Array||"[object Array]"===Object.prototype.toString.call(a)}function d(a){return null!=a&&"[object Object]"===Object.prototype.toString.call(a)}function e(a){var b;for(b in a)return!1;return!0}function f(a){return void 0===a}function g(a){return"number"==typeof a||"[object Number]"===Object.prototype.toString.call(a)}function h(a){return a instanceof Date||"[object Date]"===Object.prototype.toString.call(a)}function i(a,b){var c,d=[];for(c=0;c<a.length;++c)d.push(b(a[c],c));return d}function j(a,b){return Object.prototype.hasOwnProperty.call(a,b)}function k(a,b){for(var c in b)j(b,c)&&(a[c]=b[c]);return j(b,"toString")&&(a.toString=b.toString),j(b,"valueOf")&&(a.valueOf=b.valueOf),a}function l(a,b,c,d){return sb(a,b,c,d,!0).utc()}function m(){return{empty:!1,unusedTokens:[],unusedInput:[],overflow:-2,charsLeftOver:0,nullInput:!1,invalidMonth:null,invalidFormat:!1,userInvalidated:!1,iso:!1,parsedDateParts:[],meridiem:null,rfc2822:!1,weekdayMismatch:!1}}function n(a){return null==a._pf&&(a._pf=m()),a._pf}function o(a){if(null==a._isValid){var b=n(a),c=ud.call(b.parsedDateParts,function(a){return null!=a}),d=!isNaN(a._d.getTime())&&b.overflow<0&&!b.empty&&!b.invalidMonth&&!b.invalidWeekday&&!b.nullInput&&!b.invalidFormat&&!b.userInvalidated&&(!b.meridiem||b.meridiem&&c);if(a._strict&&(d=d&&0===b.charsLeftOver&&0===b.unusedTokens.length&&void 0===b.bigHour),null!=Object.isFrozen&&Object.isFrozen(a))return d;a._isValid=d}return a._isValid}function p(a){var b=l(NaN);return null!=a?k(n(b),a):n(b).userInvalidated=!0,b}function q(a,b){var c,d,e;if(f(b._isAMomentObject)||(a._isAMomentObject=b._isAMomentObject),f(b._i)||(a._i=b._i),f(b._f)||(a._f=b._f),f(b._l)||(a._l=b._l),f(b._strict)||(a._strict=b._strict),f(b._tzm)||(a._tzm=b._tzm),f(b._isUTC)||(a._isUTC=b._isUTC),f(b._offset)||(a._offset=b._offset),f(b._pf)||(a._pf=n(b)),f(b._locale)||(a._locale=b._locale),vd.length>0)for(c=0;c<vd.length;c++)d=vd[c],e=b[d],f(e)||(a[d]=e);return a}function r(b){q(this,b),this._d=new Date(null!=b._d?b._d.getTime():NaN),this.isValid()||(this._d=new Date(NaN)),wd===!1&&(wd=!0,a.updateOffset(this),wd=!1)}function s(a){return a instanceof r||null!=a&&null!=a._isAMomentObject}function t(a){return a<0?Math.ceil(a)||0:Math.floor(a)}function u(a){var b=+a,c=0;return 0!==b&&isFinite(b)&&(c=t(b)),c}function v(a,b,c){var d,e=Math.min(a.length,b.length),f=Math.abs(a.length-b.length),g=0;for(d=0;d<e;d++)(c&&a[d]!==b[d]||!c&&u(a[d])!==u(b[d]))&&g++;return g+f}function w(b){a.suppressDeprecationWarnings===!1&&"undefined"!=typeof console&&console.warn&&console.warn("Deprecation warning: "+b)}function x(b,c){var d=!0;return k(function(){if(null!=a.deprecationHandler&&a.deprecationHandler(null,b),d){for(var e,f=[],g=0;g<arguments.length;g++){if(e="","object"==typeof arguments[g]){e+="\n["+g+"] ";for(var h in arguments[0])e+=h+": "+arguments[0][h]+", ";e=e.slice(0,-2)}else e=arguments[g];f.push(e)}w(b+"\nArguments: "+Array.prototype.slice.call(f).join("")+"\n"+(new Error).stack),d=!1}return c.apply(this,arguments)},c)}function y(b,c){null!=a.deprecationHandler&&a.deprecationHandler(b,c),xd[b]||(w(c),xd[b]=!0)}function z(a){return a instanceof Function||"[object Function]"===Object.prototype.toString.call(a)}function A(a){var b,c;for(c in a)b=a[c],z(b)?this[c]=b:this["_"+c]=b;this._config=a,this._dayOfMonthOrdinalParseLenient=new RegExp((this._dayOfMonthOrdinalParse.source||this._ordinalParse.source)+"|"+/\d{1,2}/.source)}function B(a,b){var c,e=k({},a);for(c in b)j(b,c)&&(d(a[c])&&d(b[c])?(e[c]={},k(e[c],a[c]),k(e[c],b[c])):null!=b[c]?e[c]=b[c]:delete e[c]);for(c in a)j(a,c)&&!j(b,c)&&d(a[c])&&(e[c]=k({},e[c]));return e}function C(a){null!=a&&this.set(a)}function D(a,b,c){var d=this._calendar[a]||this._calendar.sameElse;return z(d)?d.call(b,c):d}function E(a){var b=this._longDateFormat[a],c=this._longDateFormat[a.toUpperCase()];return b||!c?b:(this._longDateFormat[a]=c.replace(/MMMM|MM|DD|dddd/g,function(a){return a.slice(1)}),this._longDateFormat[a])}function F(){return this._invalidDate}function G(a){return this._ordinal.replace("%d",a)}function H(a,b,c,d){var e=this._relativeTime[c];return z(e)?e(a,b,c,d):e.replace(/%d/i,a)}function I(a,b){var c=this._relativeTime[a>0?"future":"past"];return z(c)?c(b):c.replace(/%s/i,b)}function J(a,b){var c=a.toLowerCase();Hd[c]=Hd[c+"s"]=Hd[b]=a}function K(a){return"string"==typeof a?Hd[a]||Hd[a.toLowerCase()]:void 0}function L(a){var b,c,d={};for(c in a)j(a,c)&&(b=K(c),b&&(d[b]=a[c]));return d}function M(a,b){Id[a]=b}function N(a){var b=[];for(var c in a)b.push({unit:c,priority:Id[c]});return b.sort(function(a,b){return a.priority-b.priority}),b}function O(b,c){return function(d){return null!=d?(Q(this,b,d),a.updateOffset(this,c),this):P(this,b)}}function P(a,b){return a.isValid()?a._d["get"+(a._isUTC?"UTC":"")+b]():NaN}function Q(a,b,c){a.isValid()&&a._d["set"+(a._isUTC?"UTC":"")+b](c)}function R(a){return a=K(a),z(this[a])?this[a]():this}function S(a,b){if("object"==typeof a){a=L(a);for(var c=N(a),d=0;d<c.length;d++)this[c[d].unit](a[c[d].unit])}else if(a=K(a),z(this[a]))return this[a](b);return this}function T(a,b,c){var d=""+Math.abs(a),e=b-d.length,f=a>=0;return(f?c?"+":"":"-")+Math.pow(10,Math.max(0,e)).toString().substr(1)+d}function U(a,b,c,d){var e=d;"string"==typeof d&&(e=function(){return this[d]()}),a&&(Md[a]=e),b&&(Md[b[0]]=function(){return T(e.apply(this,arguments),b[1],b[2])}),c&&(Md[c]=function(){return this.localeData().ordinal(e.apply(this,arguments),a)})}function V(a){return a.match(/\[[\s\S]/)?a.replace(/^\[|\]$/g,""):a.replace(/\\/g,"")}function W(a){var b,c,d=a.match(Jd);for(b=0,c=d.length;b<c;b++)Md[d[b]]?d[b]=Md[d[b]]:d[b]=V(d[b]);return function(b){var e,f="";for(e=0;e<c;e++)f+=z(d[e])?d[e].call(b,a):d[e];return f}}function X(a,b){return a.isValid()?(b=Y(b,a.localeData()),Ld[b]=Ld[b]||W(b),Ld[b](a)):a.localeData().invalidDate()}function Y(a,b){function c(a){return b.longDateFormat(a)||a}var d=5;for(Kd.lastIndex=0;d>=0&&Kd.test(a);)a=a.replace(Kd,c),Kd.lastIndex=0,d-=1;return a}function Z(a,b,c){ce[a]=z(b)?b:function(a,d){return a&&c?c:b}}function $(a,b){return j(ce,a)?ce[a](b._strict,b._locale):new RegExp(_(a))}function _(a){return aa(a.replace("\\","").replace(/\\(\[)|\\(\])|\[([^\]\[]*)\]|\\(.)/g,function(a,b,c,d,e){return b||c||d||e}))}function aa(a){return a.replace(/[-\/\\^$*+?.()|[\]{}]/g,"\\$&")}function ba(a,b){var c,d=b;for("string"==typeof a&&(a=[a]),g(b)&&(d=function(a,c){c[b]=u(a)}),c=0;c<a.length;c++)de[a[c]]=d}function ca(a,b){ba(a,function(a,c,d,e){d._w=d._w||{},b(a,d._w,d,e)})}function da(a,b,c){null!=b&&j(de,a)&&de[a](b,c._a,c,a)}function ea(a,b){return new Date(Date.UTC(a,b+1,0)).getUTCDate()}function fa(a,b){return a?c(this._months)?this._months[a.month()]:this._months[(this._months.isFormat||oe).test(b)?"format":"standalone"][a.month()]:c(this._months)?this._months:this._months.standalone}function ga(a,b){return a?c(this._monthsShort)?this._monthsShort[a.month()]:this._monthsShort[oe.test(b)?"format":"standalone"][a.month()]:c(this._monthsShort)?this._monthsShort:this._monthsShort.standalone}function ha(a,b,c){var d,e,f,g=a.toLocaleLowerCase();if(!this._monthsParse)for(this._monthsParse=[],this._longMonthsParse=[],this._shortMonthsParse=[],d=0;d<12;++d)f=l([2e3,d]),this._shortMonthsParse[d]=this.monthsShort(f,"").toLocaleLowerCase(),this._longMonthsParse[d]=this.months(f,"").toLocaleLowerCase();return c?"MMM"===b?(e=ne.call(this._shortMonthsParse,g),e!==-1?e:null):(e=ne.call(this._longMonthsParse,g),e!==-1?e:null):"MMM"===b?(e=ne.call(this._shortMonthsParse,g),e!==-1?e:(e=ne.call(this._longMonthsParse,g),e!==-1?e:null)):(e=ne.call(this._longMonthsParse,g),e!==-1?e:(e=ne.call(this._shortMonthsParse,g),e!==-1?e:null))}function ia(a,b,c){var d,e,f;if(this._monthsParseExact)return ha.call(this,a,b,c);for(this._monthsParse||(this._monthsParse=[],this._longMonthsParse=[],this._shortMonthsParse=[]),d=0;d<12;d++){if(e=l([2e3,d]),c&&!this._longMonthsParse[d]&&(this._longMonthsParse[d]=new RegExp("^"+this.months(e,"").replace(".","")+"$","i"),this._shortMonthsParse[d]=new RegExp("^"+this.monthsShort(e,"").replace(".","")+"$","i")),c||this._monthsParse[d]||(f="^"+this.months(e,"")+"|^"+this.monthsShort(e,""),this._monthsParse[d]=new RegExp(f.replace(".",""),"i")),c&&"MMMM"===b&&this._longMonthsParse[d].test(a))return d;if(c&&"MMM"===b&&this._shortMonthsParse[d].test(a))return d;if(!c&&this._monthsParse[d].test(a))return d}}function ja(a,b){var c;if(!a.isValid())return a;if("string"==typeof b)if(/^\d+$/.test(b))b=u(b);else if(b=a.localeData().monthsParse(b),!g(b))return a;return c=Math.min(a.date(),ea(a.year(),b)),a._d["set"+(a._isUTC?"UTC":"")+"Month"](b,c),a}function ka(b){return null!=b?(ja(this,b),a.updateOffset(this,!0),this):P(this,"Month")}function la(){return ea(this.year(),this.month())}function ma(a){return this._monthsParseExact?(j(this,"_monthsRegex")||oa.call(this),a?this._monthsShortStrictRegex:this._monthsShortRegex):(j(this,"_monthsShortRegex")||(this._monthsShortRegex=re),this._monthsShortStrictRegex&&a?this._monthsShortStrictRegex:this._monthsShortRegex)}function na(a){return this._monthsParseExact?(j(this,"_monthsRegex")||oa.call(this),a?this._monthsStrictRegex:this._monthsRegex):(j(this,"_monthsRegex")||(this._monthsRegex=se),this._monthsStrictRegex&&a?this._monthsStrictRegex:this._monthsRegex)}function oa(){function a(a,b){return b.length-a.length}var b,c,d=[],e=[],f=[];for(b=0;b<12;b++)c=l([2e3,b]),d.push(this.monthsShort(c,"")),e.push(this.months(c,"")),f.push(this.months(c,"")),f.push(this.monthsShort(c,""));for(d.sort(a),e.sort(a),f.sort(a),b=0;b<12;b++)d[b]=aa(d[b]),e[b]=aa(e[b]);for(b=0;b<24;b++)f[b]=aa(f[b]);this._monthsRegex=new RegExp("^("+f.join("|")+")","i"),this._monthsShortRegex=this._monthsRegex,this._monthsStrictRegex=new RegExp("^("+e.join("|")+")","i"),this._monthsShortStrictRegex=new RegExp("^("+d.join("|")+")","i")}function pa(a){return qa(a)?366:365}function qa(a){return a%4===0&&a%100!==0||a%400===0}function ra(){return qa(this.year())}function sa(a,b,c,d,e,f,g){var h=new Date(a,b,c,d,e,f,g);return a<100&&a>=0&&isFinite(h.getFullYear())&&h.setFullYear(a),h}function ta(a){var b=new Date(Date.UTC.apply(null,arguments));return a<100&&a>=0&&isFinite(b.getUTCFullYear())&&b.setUTCFullYear(a),b}function ua(a,b,c){var d=7+b-c,e=(7+ta(a,0,d).getUTCDay()-b)%7;return-e+d-1}function va(a,b,c,d,e){var f,g,h=(7+c-d)%7,i=ua(a,d,e),j=1+7*(b-1)+h+i;return j<=0?(f=a-1,g=pa(f)+j):j>pa(a)?(f=a+1,g=j-pa(a)):(f=a,g=j),{year:f,dayOfYear:g}}function wa(a,b,c){var d,e,f=ua(a.year(),b,c),g=Math.floor((a.dayOfYear()-f-1)/7)+1;return g<1?(e=a.year()-1,d=g+xa(e,b,c)):g>xa(a.year(),b,c)?(d=g-xa(a.year(),b,c),e=a.year()+1):(e=a.year(),d=g),{week:d,year:e}}function xa(a,b,c){var d=ua(a,b,c),e=ua(a+1,b,c);return(pa(a)-d+e)/7}function ya(a){return wa(a,this._week.dow,this._week.doy).week}function za(){return this._week.dow}function Aa(){return this._week.doy}function Ba(a){var b=this.localeData().week(this);return null==a?b:this.add(7*(a-b),"d")}function Ca(a){var b=wa(this,1,4).week;return null==a?b:this.add(7*(a-b),"d")}function Da(a,b){return"string"!=typeof a?a:isNaN(a)?(a=b.weekdaysParse(a),"number"==typeof a?a:null):parseInt(a,10)}function Ea(a,b){return"string"==typeof a?b.weekdaysParse(a)%7||7:isNaN(a)?null:a}function Fa(a,b){return a?c(this._weekdays)?this._weekdays[a.day()]:this._weekdays[this._weekdays.isFormat.test(b)?"format":"standalone"][a.day()]:c(this._weekdays)?this._weekdays:this._weekdays.standalone}function Ga(a){return a?this._weekdaysShort[a.day()]:this._weekdaysShort}function Ha(a){return a?this._weekdaysMin[a.day()]:this._weekdaysMin}function Ia(a,b,c){var d,e,f,g=a.toLocaleLowerCase();if(!this._weekdaysParse)for(this._weekdaysParse=[],this._shortWeekdaysParse=[],this._minWeekdaysParse=[],d=0;d<7;++d)f=l([2e3,1]).day(d),this._minWeekdaysParse[d]=this.weekdaysMin(f,"").toLocaleLowerCase(),this._shortWeekdaysParse[d]=this.weekdaysShort(f,"").toLocaleLowerCase(),this._weekdaysParse[d]=this.weekdays(f,"").toLocaleLowerCase();return c?"dddd"===b?(e=ne.call(this._weekdaysParse,g),e!==-1?e:null):"ddd"===b?(e=ne.call(this._shortWeekdaysParse,g),e!==-1?e:null):(e=ne.call(this._minWeekdaysParse,g),e!==-1?e:null):"dddd"===b?(e=ne.call(this._weekdaysParse,g),e!==-1?e:(e=ne.call(this._shortWeekdaysParse,g),e!==-1?e:(e=ne.call(this._minWeekdaysParse,g),e!==-1?e:null))):"ddd"===b?(e=ne.call(this._shortWeekdaysParse,g),e!==-1?e:(e=ne.call(this._weekdaysParse,g),e!==-1?e:(e=ne.call(this._minWeekdaysParse,g),e!==-1?e:null))):(e=ne.call(this._minWeekdaysParse,g),e!==-1?e:(e=ne.call(this._weekdaysParse,g),e!==-1?e:(e=ne.call(this._shortWeekdaysParse,g),e!==-1?e:null)))}function Ja(a,b,c){var d,e,f;if(this._weekdaysParseExact)return Ia.call(this,a,b,c);for(this._weekdaysParse||(this._weekdaysParse=[],this._minWeekdaysParse=[],this._shortWeekdaysParse=[],this._fullWeekdaysParse=[]),d=0;d<7;d++){if(e=l([2e3,1]).day(d),c&&!this._fullWeekdaysParse[d]&&(this._fullWeekdaysParse[d]=new RegExp("^"+this.weekdays(e,"").replace(".",".?")+"$","i"),this._shortWeekdaysParse[d]=new RegExp("^"+this.weekdaysShort(e,"").replace(".",".?")+"$","i"),this._minWeekdaysParse[d]=new RegExp("^"+this.weekdaysMin(e,"").replace(".",".?")+"$","i")),this._weekdaysParse[d]||(f="^"+this.weekdays(e,"")+"|^"+this.weekdaysShort(e,"")+"|^"+this.weekdaysMin(e,""),this._weekdaysParse[d]=new RegExp(f.replace(".",""),"i")),c&&"dddd"===b&&this._fullWeekdaysParse[d].test(a))return d;if(c&&"ddd"===b&&this._shortWeekdaysParse[d].test(a))return d;if(c&&"dd"===b&&this._minWeekdaysParse[d].test(a))return d;if(!c&&this._weekdaysParse[d].test(a))return d}}function Ka(a){if(!this.isValid())return null!=a?this:NaN;var b=this._isUTC?this._d.getUTCDay():this._d.getDay();return null!=a?(a=Da(a,this.localeData()),this.add(a-b,"d")):b}function La(a){if(!this.isValid())return null!=a?this:NaN;var b=(this.day()+7-this.localeData()._week.dow)%7;return null==a?b:this.add(a-b,"d")}function Ma(a){if(!this.isValid())return null!=a?this:NaN;if(null!=a){var b=Ea(a,this.localeData());return this.day(this.day()%7?b:b-7)}return this.day()||7}function Na(a){return this._weekdaysParseExact?(j(this,"_weekdaysRegex")||Qa.call(this),a?this._weekdaysStrictRegex:this._weekdaysRegex):(j(this,"_weekdaysRegex")||(this._weekdaysRegex=ye),this._weekdaysStrictRegex&&a?this._weekdaysStrictRegex:this._weekdaysRegex)}function Oa(a){return this._weekdaysParseExact?(j(this,"_weekdaysRegex")||Qa.call(this),a?this._weekdaysShortStrictRegex:this._weekdaysShortRegex):(j(this,"_weekdaysShortRegex")||(this._weekdaysShortRegex=ze),this._weekdaysShortStrictRegex&&a?this._weekdaysShortStrictRegex:this._weekdaysShortRegex)}function Pa(a){return this._weekdaysParseExact?(j(this,"_weekdaysRegex")||Qa.call(this),a?this._weekdaysMinStrictRegex:this._weekdaysMinRegex):(j(this,"_weekdaysMinRegex")||(this._weekdaysMinRegex=Ae),this._weekdaysMinStrictRegex&&a?this._weekdaysMinStrictRegex:this._weekdaysMinRegex)}function Qa(){function a(a,b){return b.length-a.length}var b,c,d,e,f,g=[],h=[],i=[],j=[];for(b=0;b<7;b++)c=l([2e3,1]).day(b),d=this.weekdaysMin(c,""),e=this.weekdaysShort(c,""),f=this.weekdays(c,""),g.push(d),h.push(e),i.push(f),j.push(d),j.push(e),j.push(f);for(g.sort(a),h.sort(a),i.sort(a),j.sort(a),b=0;b<7;b++)h[b]=aa(h[b]),i[b]=aa(i[b]),j[b]=aa(j[b]);this._weekdaysRegex=new RegExp("^("+j.join("|")+")","i"),this._weekdaysShortRegex=this._weekdaysRegex,this._weekdaysMinRegex=this._weekdaysRegex,this._weekdaysStrictRegex=new RegExp("^("+i.join("|")+")","i"),this._weekdaysShortStrictRegex=new RegExp("^("+h.join("|")+")","i"),this._weekdaysMinStrictRegex=new RegExp("^("+g.join("|")+")","i")}function Ra(){return this.hours()%12||12}function Sa(){return this.hours()||24}function Ta(a,b){U(a,0,0,function(){return this.localeData().meridiem(this.hours(),this.minutes(),b)})}function Ua(a,b){return b._meridiemParse}function Va(a){return"p"===(a+"").toLowerCase().charAt(0)}function Wa(a,b,c){return a>11?c?"pm":"PM":c?"am":"AM"}function Xa(a){return a?a.toLowerCase().replace("_","-"):a}function Ya(a){for(var b,c,d,e,f=0;f<a.length;){for(e=Xa(a[f]).split("-"),b=e.length,c=Xa(a[f+1]),c=c?c.split("-"):null;b>0;){if(d=Za(e.slice(0,b).join("-")))return d;if(c&&c.length>=b&&v(e,c,!0)>=b-1)break;b--}f++}return null}function Za(a){var b=null;if(!Fe[a]&&"undefined"!=typeof module&&module&&module.exports)try{b=Be._abbr,require("./locale/"+a),$a(b)}catch(a){}return Fe[a]}function $a(a,b){var c;return a&&(c=f(b)?bb(a):_a(a,b),c&&(Be=c)),Be._abbr}function _a(a,b){if(null!==b){var c=Ee;if(b.abbr=a,null!=Fe[a])y("defineLocaleOverride","use moment.updateLocale(localeName, config) to change an existing locale. moment.defineLocale(localeName, config) should only be used for creating a new locale See http://momentjs.com/guides/#/warnings/define-locale/ for more info."),c=Fe[a]._config;else if(null!=b.parentLocale){if(null==Fe[b.parentLocale])return Ge[b.parentLocale]||(Ge[b.parentLocale]=[]),Ge[b.parentLocale].push({name:a,config:b}),null;c=Fe[b.parentLocale]._config}return Fe[a]=new C(B(c,b)),Ge[a]&&Ge[a].forEach(function(a){_a(a.name,a.config)}),$a(a),Fe[a]}return delete Fe[a],null}function ab(a,b){if(null!=b){var c,d=Ee;null!=Fe[a]&&(d=Fe[a]._config),b=B(d,b),c=new C(b),c.parentLocale=Fe[a],Fe[a]=c,$a(a)}else null!=Fe[a]&&(null!=Fe[a].parentLocale?Fe[a]=Fe[a].parentLocale:null!=Fe[a]&&delete Fe[a]);return Fe[a]}function bb(a){var b;if(a&&a._locale&&a._locale._abbr&&(a=a._locale._abbr),!a)return Be;if(!c(a)){if(b=Za(a))return b;a=[a]}return Ya(a)}function cb(){return Ad(Fe)}function db(a){var b,c=a._a;return c&&n(a).overflow===-2&&(b=c[fe]<0||c[fe]>11?fe:c[ge]<1||c[ge]>ea(c[ee],c[fe])?ge:c[he]<0||c[he]>24||24===c[he]&&(0!==c[ie]||0!==c[je]||0!==c[ke])?he:c[ie]<0||c[ie]>59?ie:c[je]<0||c[je]>59?je:c[ke]<0||c[ke]>999?ke:-1,n(a)._overflowDayOfYear&&(b<ee||b>ge)&&(b=ge),n(a)._overflowWeeks&&b===-1&&(b=le),n(a)._overflowWeekday&&b===-1&&(b=me),n(a).overflow=b),a}function eb(a){var b,c,d,e,f,g,h=a._i,i=He.exec(h)||Ie.exec(h);if(i){for(n(a).iso=!0,b=0,c=Ke.length;b<c;b++)if(Ke[b][1].exec(i[1])){e=Ke[b][0],d=Ke[b][2]!==!1;break}if(null==e)return void(a._isValid=!1);if(i[3]){for(b=0,c=Le.length;b<c;b++)if(Le[b][1].exec(i[3])){f=(i[2]||" ")+Le[b][0];break}if(null==f)return void(a._isValid=!1)}if(!d&&null!=f)return void(a._isValid=!1);if(i[4]){if(!Je.exec(i[4]))return void(a._isValid=!1);g="Z"}a._f=e+(f||"")+(g||""),lb(a)}else a._isValid=!1}function fb(a){var b,c,d,e,f,g,h,i,j={" GMT":" +0000"," EDT":" -0400"," EST":" -0500"," CDT":" -0500"," CST":" -0600"," MDT":" -0600"," MST":" -0700"," PDT":" -0700"," PST":" -0800"},k="YXWVUTSRQPONZABCDEFGHIKLM";if(b=a._i.replace(/\([^\)]*\)|[\n\t]/g," ").replace(/(\s\s+)/g," ").replace(/^\s|\s$/g,""),c=Ne.exec(b)){if(d=c[1]?"ddd"+(5===c[1].length?", ":" "):"",e="D MMM "+(c[2].length>10?"YYYY ":"YY "),f="HH:mm"+(c[4]?":ss":""),c[1]){var l=new Date(c[2]),m=["Sun","Mon","Tue","Wed","Thu","Fri","Sat"][l.getDay()];if(c[1].substr(0,3)!==m)return n(a).weekdayMismatch=!0,void(a._isValid=!1)}switch(c[5].length){case 2:0===i?h=" +0000":(i=k.indexOf(c[5][1].toUpperCase())-12,h=(i<0?" -":" +")+(""+i).replace(/^-?/,"0").match(/..$/)[0]+"00");break;case 4:h=j[c[5]];break;default:h=j[" GMT"]}c[5]=h,a._i=c.splice(1).join(""),g=" ZZ",a._f=d+e+f+g,lb(a),n(a).rfc2822=!0}else a._isValid=!1}function gb(b){var c=Me.exec(b._i);return null!==c?void(b._d=new Date(+c[1])):(eb(b),void(b._isValid===!1&&(delete b._isValid,fb(b),b._isValid===!1&&(delete b._isValid,a.createFromInputFallback(b)))))}function hb(a,b,c){return null!=a?a:null!=b?b:c}function ib(b){var c=new Date(a.now());return b._useUTC?[c.getUTCFullYear(),c.getUTCMonth(),c.getUTCDate()]:[c.getFullYear(),c.getMonth(),c.getDate()]}function jb(a){var b,c,d,e,f=[];if(!a._d){for(d=ib(a),a._w&&null==a._a[ge]&&null==a._a[fe]&&kb(a),null!=a._dayOfYear&&(e=hb(a._a[ee],d[ee]),(a._dayOfYear>pa(e)||0===a._dayOfYear)&&(n(a)._overflowDayOfYear=!0),c=ta(e,0,a._dayOfYear),a._a[fe]=c.getUTCMonth(),a._a[ge]=c.getUTCDate()),b=0;b<3&&null==a._a[b];++b)a._a[b]=f[b]=d[b];for(;b<7;b++)a._a[b]=f[b]=null==a._a[b]?2===b?1:0:a._a[b];24===a._a[he]&&0===a._a[ie]&&0===a._a[je]&&0===a._a[ke]&&(a._nextDay=!0,a._a[he]=0),a._d=(a._useUTC?ta:sa).apply(null,f),null!=a._tzm&&a._d.setUTCMinutes(a._d.getUTCMinutes()-a._tzm),a._nextDay&&(a._a[he]=24)}}function kb(a){var b,c,d,e,f,g,h,i;if(b=a._w,null!=b.GG||null!=b.W||null!=b.E)f=1,g=4,c=hb(b.GG,a._a[ee],wa(tb(),1,4).year),d=hb(b.W,1),e=hb(b.E,1),(e<1||e>7)&&(i=!0);else{f=a._locale._week.dow,g=a._locale._week.doy;var j=wa(tb(),f,g);c=hb(b.gg,a._a[ee],j.year),d=hb(b.w,j.week),null!=b.d?(e=b.d,(e<0||e>6)&&(i=!0)):null!=b.e?(e=b.e+f,(b.e<0||b.e>6)&&(i=!0)):e=f}d<1||d>xa(c,f,g)?n(a)._overflowWeeks=!0:null!=i?n(a)._overflowWeekday=!0:(h=va(c,d,e,f,g),a._a[ee]=h.year,a._dayOfYear=h.dayOfYear)}function lb(b){if(b._f===a.ISO_8601)return void eb(b);if(b._f===a.RFC_2822)return void fb(b);b._a=[],n(b).empty=!0;var c,d,e,f,g,h=""+b._i,i=h.length,j=0;for(e=Y(b._f,b._locale).match(Jd)||[],c=0;c<e.length;c++)f=e[c],d=(h.match($(f,b))||[])[0],d&&(g=h.substr(0,h.indexOf(d)),g.length>0&&n(b).unusedInput.push(g),h=h.slice(h.indexOf(d)+d.length),j+=d.length),Md[f]?(d?n(b).empty=!1:n(b).unusedTokens.push(f),da(f,d,b)):b._strict&&!d&&n(b).unusedTokens.push(f);n(b).charsLeftOver=i-j,h.length>0&&n(b).unusedInput.push(h),b._a[he]<=12&&n(b).bigHour===!0&&b._a[he]>0&&(n(b).bigHour=void 0),n(b).parsedDateParts=b._a.slice(0),n(b).meridiem=b._meridiem,b._a[he]=mb(b._locale,b._a[he],b._meridiem),jb(b),db(b)}function mb(a,b,c){var d;return null==c?b:null!=a.meridiemHour?a.meridiemHour(b,c):null!=a.isPM?(d=a.isPM(c),d&&b<12&&(b+=12),d||12!==b||(b=0),b):b}function nb(a){var b,c,d,e,f;if(0===a._f.length)return n(a).invalidFormat=!0,void(a._d=new Date(NaN));for(e=0;e<a._f.length;e++)f=0,b=q({},a),null!=a._useUTC&&(b._useUTC=a._useUTC),b._f=a._f[e],lb(b),o(b)&&(f+=n(b).charsLeftOver,f+=10*n(b).unusedTokens.length,n(b).score=f,(null==d||f<d)&&(d=f,c=b));k(a,c||b)}function ob(a){if(!a._d){var b=L(a._i);a._a=i([b.year,b.month,b.day||b.date,b.hour,b.minute,b.second,b.millisecond],function(a){return a&&parseInt(a,10)}),jb(a)}}function pb(a){var b=new r(db(qb(a)));return b._nextDay&&(b.add(1,"d"),b._nextDay=void 0),b}function qb(a){var b=a._i,d=a._f;return a._locale=a._locale||bb(a._l),null===b||void 0===d&&""===b?p({nullInput:!0}):("string"==typeof b&&(a._i=b=a._locale.preparse(b)),s(b)?new r(db(b)):(h(b)?a._d=b:c(d)?nb(a):d?lb(a):rb(a),o(a)||(a._d=null),a))}function rb(b){var e=b._i;f(e)?b._d=new Date(a.now()):h(e)?b._d=new Date(e.valueOf()):"string"==typeof e?gb(b):c(e)?(b._a=i(e.slice(0),function(a){return parseInt(a,10)}),jb(b)):d(e)?ob(b):g(e)?b._d=new Date(e):a.createFromInputFallback(b)}function sb(a,b,f,g,h){var i={};return f!==!0&&f!==!1||(g=f,f=void 0),(d(a)&&e(a)||c(a)&&0===a.length)&&(a=void 0),i._isAMomentObject=!0,i._useUTC=i._isUTC=h,i._l=f,i._i=a,i._f=b,i._strict=g,pb(i)}function tb(a,b,c,d){return sb(a,b,c,d,!1)}function ub(a,b){var d,e;if(1===b.length&&c(b[0])&&(b=b[0]),!b.length)return tb();for(d=b[0],e=1;e<b.length;++e)b[e].isValid()&&!b[e][a](d)||(d=b[e]);return d}function vb(){var a=[].slice.call(arguments,0);return ub("isBefore",a)}function wb(){var a=[].slice.call(arguments,0);return ub("isAfter",a)}function xb(a){for(var b in a)if(Re.indexOf(b)===-1||null!=a[b]&&isNaN(a[b]))return!1;for(var c=!1,d=0;d<Re.length;++d)if(a[Re[d]]){if(c)return!1;parseFloat(a[Re[d]])!==u(a[Re[d]])&&(c=!0)}return!0}function yb(){return this._isValid}function zb(){return Sb(NaN)}function Ab(a){var b=L(a),c=b.year||0,d=b.quarter||0,e=b.month||0,f=b.week||0,g=b.day||0,h=b.hour||0,i=b.minute||0,j=b.second||0,k=b.millisecond||0;this._isValid=xb(b),this._milliseconds=+k+1e3*j+6e4*i+1e3*h*60*60,this._days=+g+7*f,this._months=+e+3*d+12*c,this._data={},this._locale=bb(),this._bubble()}function Bb(a){return a instanceof Ab}function Cb(a){return a<0?Math.round(-1*a)*-1:Math.round(a)}function Db(a,b){U(a,0,0,function(){var a=this.utcOffset(),c="+";return a<0&&(a=-a,c="-"),c+T(~~(a/60),2)+b+T(~~a%60,2)})}function Eb(a,b){var c=(b||"").match(a);if(null===c)return null;var d=c[c.length-1]||[],e=(d+"").match(Se)||["-",0,0],f=+(60*e[1])+u(e[2]);return 0===f?0:"+"===e[0]?f:-f}function Fb(b,c){var d,e;return c._isUTC?(d=c.clone(),e=(s(b)||h(b)?b.valueOf():tb(b).valueOf())-d.valueOf(),d._d.setTime(d._d.valueOf()+e),a.updateOffset(d,!1),d):tb(b).local()}function Gb(a){return 15*-Math.round(a._d.getTimezoneOffset()/15)}function Hb(b,c,d){var e,f=this._offset||0;if(!this.isValid())return null!=b?this:NaN;if(null!=b){if("string"==typeof b){if(b=Eb(_d,b),null===b)return this}else Math.abs(b)<16&&!d&&(b=60*b);return!this._isUTC&&c&&(e=Gb(this)),this._offset=b,this._isUTC=!0,null!=e&&this.add(e,"m"),f!==b&&(!c||this._changeInProgress?Xb(this,Sb(b-f,"m"),1,!1):this._changeInProgress||(this._changeInProgress=!0,a.updateOffset(this,!0),this._changeInProgress=null)),this}return this._isUTC?f:Gb(this)}function Ib(a,b){return null!=a?("string"!=typeof a&&(a=-a),this.utcOffset(a,b),this):-this.utcOffset()}function Jb(a){return this.utcOffset(0,a)}function Kb(a){return this._isUTC&&(this.utcOffset(0,a),this._isUTC=!1,a&&this.subtract(Gb(this),"m")),this}function Lb(){if(null!=this._tzm)this.utcOffset(this._tzm,!1,!0);else if("string"==typeof this._i){var a=Eb($d,this._i);null!=a?this.utcOffset(a):this.utcOffset(0,!0)}return this}function Mb(a){return!!this.isValid()&&(a=a?tb(a).utcOffset():0,(this.utcOffset()-a)%60===0)}function Nb(){return this.utcOffset()>this.clone().month(0).utcOffset()||this.utcOffset()>this.clone().month(5).utcOffset()}function Ob(){if(!f(this._isDSTShifted))return this._isDSTShifted;var a={};if(q(a,this),a=qb(a),a._a){var b=a._isUTC?l(a._a):tb(a._a);this._isDSTShifted=this.isValid()&&v(a._a,b.toArray())>0}else this._isDSTShifted=!1;return this._isDSTShifted}function Pb(){return!!this.isValid()&&!this._isUTC}function Qb(){return!!this.isValid()&&this._isUTC}function Rb(){return!!this.isValid()&&(this._isUTC&&0===this._offset)}function Sb(a,b){var c,d,e,f=a,h=null;return Bb(a)?f={ms:a._milliseconds,d:a._days,M:a._months}:g(a)?(f={},b?f[b]=a:f.milliseconds=a):(h=Te.exec(a))?(c="-"===h[1]?-1:1,f={y:0,d:u(h[ge])*c,h:u(h[he])*c,m:u(h[ie])*c,s:u(h[je])*c,ms:u(Cb(1e3*h[ke]))*c}):(h=Ue.exec(a))?(c="-"===h[1]?-1:1,f={y:Tb(h[2],c),M:Tb(h[3],c),w:Tb(h[4],c),d:Tb(h[5],c),h:Tb(h[6],c),m:Tb(h[7],c),s:Tb(h[8],c)}):null==f?f={}:"object"==typeof f&&("from"in f||"to"in f)&&(e=Vb(tb(f.from),tb(f.to)),f={},f.ms=e.milliseconds,f.M=e.months),d=new Ab(f),Bb(a)&&j(a,"_locale")&&(d._locale=a._locale),d}function Tb(a,b){var c=a&&parseFloat(a.replace(",","."));return(isNaN(c)?0:c)*b}function Ub(a,b){var c={milliseconds:0,months:0};return c.months=b.month()-a.month()+12*(b.year()-a.year()),a.clone().add(c.months,"M").isAfter(b)&&--c.months,c.milliseconds=+b-+a.clone().add(c.months,"M"),c}function Vb(a,b){var c;return a.isValid()&&b.isValid()?(b=Fb(b,a),a.isBefore(b)?c=Ub(a,b):(c=Ub(b,a),c.milliseconds=-c.milliseconds,c.months=-c.months),c):{milliseconds:0,months:0}}function Wb(a,b){return function(c,d){var e,f;return null===d||isNaN(+d)||(y(b,"moment()."+b+"(period, number) is deprecated. Please use moment()."+b+"(number, period). See http://momentjs.com/guides/#/warnings/add-inverted-param/ for more info."),f=c,c=d,d=f),c="string"==typeof c?+c:c,e=Sb(c,d),Xb(this,e,a),this}}function Xb(b,c,d,e){var f=c._milliseconds,g=Cb(c._days),h=Cb(c._months);b.isValid()&&(e=null==e||e,f&&b._d.setTime(b._d.valueOf()+f*d),g&&Q(b,"Date",P(b,"Date")+g*d),h&&ja(b,P(b,"Month")+h*d),e&&a.updateOffset(b,g||h))}function Yb(a,b){var c=a.diff(b,"days",!0);return c<-6?"sameElse":c<-1?"lastWeek":c<0?"lastDay":c<1?"sameDay":c<2?"nextDay":c<7?"nextWeek":"sameElse"}function Zb(b,c){var d=b||tb(),e=Fb(d,this).startOf("day"),f=a.calendarFormat(this,e)||"sameElse",g=c&&(z(c[f])?c[f].call(this,d):c[f]);return this.format(g||this.localeData().calendar(f,this,tb(d)))}function $b(){return new r(this)}function _b(a,b){var c=s(a)?a:tb(a);return!(!this.isValid()||!c.isValid())&&(b=K(f(b)?"millisecond":b),"millisecond"===b?this.valueOf()>c.valueOf():c.valueOf()<this.clone().startOf(b).valueOf())}function ac(a,b){var c=s(a)?a:tb(a);return!(!this.isValid()||!c.isValid())&&(b=K(f(b)?"millisecond":b),"millisecond"===b?this.valueOf()<c.valueOf():this.clone().endOf(b).valueOf()<c.valueOf())}function bc(a,b,c,d){return d=d||"()",("("===d[0]?this.isAfter(a,c):!this.isBefore(a,c))&&(")"===d[1]?this.isBefore(b,c):!this.isAfter(b,c))}function cc(a,b){var c,d=s(a)?a:tb(a);return!(!this.isValid()||!d.isValid())&&(b=K(b||"millisecond"),"millisecond"===b?this.valueOf()===d.valueOf():(c=d.valueOf(),this.clone().startOf(b).valueOf()<=c&&c<=this.clone().endOf(b).valueOf()))}function dc(a,b){return this.isSame(a,b)||this.isAfter(a,b)}function ec(a,b){return this.isSame(a,b)||this.isBefore(a,b)}function fc(a,b,c){var d,e,f,g;return this.isValid()?(d=Fb(a,this),d.isValid()?(e=6e4*(d.utcOffset()-this.utcOffset()),b=K(b),"year"===b||"month"===b||"quarter"===b?(g=gc(this,d),"quarter"===b?g/=3:"year"===b&&(g/=12)):(f=this-d,g="second"===b?f/1e3:"minute"===b?f/6e4:"hour"===b?f/36e5:"day"===b?(f-e)/864e5:"week"===b?(f-e)/6048e5:f),c?g:t(g)):NaN):NaN}function gc(a,b){var c,d,e=12*(b.year()-a.year())+(b.month()-a.month()),f=a.clone().add(e,"months");return b-f<0?(c=a.clone().add(e-1,"months"),d=(b-f)/(f-c)):(c=a.clone().add(e+1,"months"),d=(b-f)/(c-f)),-(e+d)||0}function hc(){return this.clone().locale("en").format("ddd MMM DD YYYY HH:mm:ss [GMT]ZZ")}function ic(){if(!this.isValid())return null;var a=this.clone().utc();return a.year()<0||a.year()>9999?X(a,"YYYYYY-MM-DD[T]HH:mm:ss.SSS[Z]"):z(Date.prototype.toISOString)?this.toDate().toISOString():X(a,"YYYY-MM-DD[T]HH:mm:ss.SSS[Z]")}function jc(){if(!this.isValid())return"moment.invalid(/* "+this._i+" */)";var a="moment",b="";this.isLocal()||(a=0===this.utcOffset()?"moment.utc":"moment.parseZone",b="Z");var c="["+a+'("]',d=0<=this.year()&&this.year()<=9999?"YYYY":"YYYYYY",e="-MM-DD[T]HH:mm:ss.SSS",f=b+'[")]';return this.format(c+d+e+f)}function kc(b){b||(b=this.isUtc()?a.defaultFormatUtc:a.defaultFormat);var c=X(this,b);return this.localeData().postformat(c)}function lc(a,b){return this.isValid()&&(s(a)&&a.isValid()||tb(a).isValid())?Sb({to:this,from:a}).locale(this.locale()).humanize(!b):this.localeData().invalidDate()}function mc(a){return this.from(tb(),a)}function nc(a,b){return this.isValid()&&(s(a)&&a.isValid()||tb(a).isValid())?Sb({from:this,to:a}).locale(this.locale()).humanize(!b):this.localeData().invalidDate()}function oc(a){return this.to(tb(),a)}function pc(a){var b;return void 0===a?this._locale._abbr:(b=bb(a),null!=b&&(this._locale=b),this)}function qc(){return this._locale}function rc(a){switch(a=K(a)){case"year":this.month(0);case"quarter":case"month":this.date(1);case"week":case"isoWeek":case"day":case"date":this.hours(0);case"hour":this.minutes(0);case"minute":this.seconds(0);case"second":this.milliseconds(0)}return"week"===a&&this.weekday(0),"isoWeek"===a&&this.isoWeekday(1),"quarter"===a&&this.month(3*Math.floor(this.month()/3)),this}function sc(a){return a=K(a),void 0===a||"millisecond"===a?this:("date"===a&&(a="day"),this.startOf(a).add(1,"isoWeek"===a?"week":a).subtract(1,"ms"))}function tc(){return this._d.valueOf()-6e4*(this._offset||0)}function uc(){return Math.floor(this.valueOf()/1e3)}function vc(){return new Date(this.valueOf())}function wc(){var a=this;return[a.year(),a.month(),a.date(),a.hour(),a.minute(),a.second(),a.millisecond()]}function xc(){var a=this;return{years:a.year(),months:a.month(),date:a.date(),hours:a.hours(),minutes:a.minutes(),seconds:a.seconds(),milliseconds:a.milliseconds()}}function yc(){return this.isValid()?this.toISOString():null}function zc(){return o(this)}function Ac(){
//return k({},n(this))}function Bc(){return n(this).overflow}function Cc(){return{input:this._i,format:this._f,locale:this._locale,isUTC:this._isUTC,strict:this._strict}}function Dc(a,b){U(0,[a,a.length],0,b)}function Ec(a){return Ic.call(this,a,this.week(),this.weekday(),this.localeData()._week.dow,this.localeData()._week.doy)}function Fc(a){return Ic.call(this,a,this.isoWeek(),this.isoWeekday(),1,4)}function Gc(){return xa(this.year(),1,4)}function Hc(){var a=this.localeData()._week;return xa(this.year(),a.dow,a.doy)}function Ic(a,b,c,d,e){var f;return null==a?wa(this,d,e).year:(f=xa(a,d,e),b>f&&(b=f),Jc.call(this,a,b,c,d,e))}function Jc(a,b,c,d,e){var f=va(a,b,c,d,e),g=ta(f.year,0,f.dayOfYear);return this.year(g.getUTCFullYear()),this.month(g.getUTCMonth()),this.date(g.getUTCDate()),this}function Kc(a){return null==a?Math.ceil((this.month()+1)/3):this.month(3*(a-1)+this.month()%3)}function Lc(a){var b=Math.round((this.clone().startOf("day")-this.clone().startOf("year"))/864e5)+1;return null==a?b:this.add(a-b,"d")}function Mc(a,b){b[ke]=u(1e3*("0."+a))}function Nc(){return this._isUTC?"UTC":""}function Oc(){return this._isUTC?"Coordinated Universal Time":""}function Pc(a){return tb(1e3*a)}function Qc(){return tb.apply(null,arguments).parseZone()}function Rc(a){return a}function Sc(a,b,c,d){var e=bb(),f=l().set(d,b);return e[c](f,a)}function Tc(a,b,c){if(g(a)&&(b=a,a=void 0),a=a||"",null!=b)return Sc(a,b,c,"month");var d,e=[];for(d=0;d<12;d++)e[d]=Sc(a,d,c,"month");return e}function Uc(a,b,c,d){"boolean"==typeof a?(g(b)&&(c=b,b=void 0),b=b||""):(b=a,c=b,a=!1,g(b)&&(c=b,b=void 0),b=b||"");var e=bb(),f=a?e._week.dow:0;if(null!=c)return Sc(b,(c+f)%7,d,"day");var h,i=[];for(h=0;h<7;h++)i[h]=Sc(b,(h+f)%7,d,"day");return i}function Vc(a,b){return Tc(a,b,"months")}function Wc(a,b){return Tc(a,b,"monthsShort")}function Xc(a,b,c){return Uc(a,b,c,"weekdays")}function Yc(a,b,c){return Uc(a,b,c,"weekdaysShort")}function Zc(a,b,c){return Uc(a,b,c,"weekdaysMin")}function $c(){var a=this._data;return this._milliseconds=df(this._milliseconds),this._days=df(this._days),this._months=df(this._months),a.milliseconds=df(a.milliseconds),a.seconds=df(a.seconds),a.minutes=df(a.minutes),a.hours=df(a.hours),a.months=df(a.months),a.years=df(a.years),this}function _c(a,b,c,d){var e=Sb(b,c);return a._milliseconds+=d*e._milliseconds,a._days+=d*e._days,a._months+=d*e._months,a._bubble()}function ad(a,b){return _c(this,a,b,1)}function bd(a,b){return _c(this,a,b,-1)}function cd(a){return a<0?Math.floor(a):Math.ceil(a)}function dd(){var a,b,c,d,e,f=this._milliseconds,g=this._days,h=this._months,i=this._data;return f>=0&&g>=0&&h>=0||f<=0&&g<=0&&h<=0||(f+=864e5*cd(fd(h)+g),g=0,h=0),i.milliseconds=f%1e3,a=t(f/1e3),i.seconds=a%60,b=t(a/60),i.minutes=b%60,c=t(b/60),i.hours=c%24,g+=t(c/24),e=t(ed(g)),h+=e,g-=cd(fd(e)),d=t(h/12),h%=12,i.days=g,i.months=h,i.years=d,this}function ed(a){return 4800*a/146097}function fd(a){return 146097*a/4800}function gd(a){if(!this.isValid())return NaN;var b,c,d=this._milliseconds;if(a=K(a),"month"===a||"year"===a)return b=this._days+d/864e5,c=this._months+ed(b),"month"===a?c:c/12;switch(b=this._days+Math.round(fd(this._months)),a){case"week":return b/7+d/6048e5;case"day":return b+d/864e5;case"hour":return 24*b+d/36e5;case"minute":return 1440*b+d/6e4;case"second":return 86400*b+d/1e3;case"millisecond":return Math.floor(864e5*b)+d;default:throw new Error("Unknown unit "+a)}}function hd(){return this.isValid()?this._milliseconds+864e5*this._days+this._months%12*2592e6+31536e6*u(this._months/12):NaN}function id(a){return function(){return this.as(a)}}function jd(a){return a=K(a),this.isValid()?this[a+"s"]():NaN}function kd(a){return function(){return this.isValid()?this._data[a]:NaN}}function ld(){return t(this.days()/7)}function md(a,b,c,d,e){return e.relativeTime(b||1,!!c,a,d)}function nd(a,b,c){var d=Sb(a).abs(),e=uf(d.as("s")),f=uf(d.as("m")),g=uf(d.as("h")),h=uf(d.as("d")),i=uf(d.as("M")),j=uf(d.as("y")),k=e<=vf.ss&&["s",e]||e<vf.s&&["ss",e]||f<=1&&["m"]||f<vf.m&&["mm",f]||g<=1&&["h"]||g<vf.h&&["hh",g]||h<=1&&["d"]||h<vf.d&&["dd",h]||i<=1&&["M"]||i<vf.M&&["MM",i]||j<=1&&["y"]||["yy",j];return k[2]=b,k[3]=+a>0,k[4]=c,md.apply(null,k)}function od(a){return void 0===a?uf:"function"==typeof a&&(uf=a,!0)}function pd(a,b){return void 0!==vf[a]&&(void 0===b?vf[a]:(vf[a]=b,"s"===a&&(vf.ss=b-1),!0))}function qd(a){if(!this.isValid())return this.localeData().invalidDate();var b=this.localeData(),c=nd(this,!a,b);return a&&(c=b.pastFuture(+this,c)),b.postformat(c)}function rd(){if(!this.isValid())return this.localeData().invalidDate();var a,b,c,d=wf(this._milliseconds)/1e3,e=wf(this._days),f=wf(this._months);a=t(d/60),b=t(a/60),d%=60,a%=60,c=t(f/12),f%=12;var g=c,h=f,i=e,j=b,k=a,l=d,m=this.asSeconds();return m?(m<0?"-":"")+"P"+(g?g+"Y":"")+(h?h+"M":"")+(i?i+"D":"")+(j||k||l?"T":"")+(j?j+"H":"")+(k?k+"M":"")+(l?l+"S":""):"P0D"}var sd,td;td=Array.prototype.some?Array.prototype.some:function(a){for(var b=Object(this),c=b.length>>>0,d=0;d<c;d++)if(d in b&&a.call(this,b[d],d,b))return!0;return!1};var ud=td,vd=a.momentProperties=[],wd=!1,xd={};a.suppressDeprecationWarnings=!1,a.deprecationHandler=null;var yd;yd=Object.keys?Object.keys:function(a){var b,c=[];for(b in a)j(a,b)&&c.push(b);return c};var zd,Ad=yd,Bd={sameDay:"[Today at] LT",nextDay:"[Tomorrow at] LT",nextWeek:"dddd [at] LT",lastDay:"[Yesterday at] LT",lastWeek:"[Last] dddd [at] LT",sameElse:"L"},Cd={LTS:"h:mm:ss A",LT:"h:mm A",L:"MM/DD/YYYY",LL:"MMMM D, YYYY",LLL:"MMMM D, YYYY h:mm A",LLLL:"dddd, MMMM D, YYYY h:mm A"},Dd="Invalid date",Ed="%d",Fd=/\d{1,2}/,Gd={future:"in %s",past:"%s ago",s:"a few seconds",ss:"%d seconds",m:"a minute",mm:"%d minutes",h:"an hour",hh:"%d hours",d:"a day",dd:"%d days",M:"a month",MM:"%d months",y:"a year",yy:"%d years"},Hd={},Id={},Jd=/(\[[^\[]*\])|(\\)?([Hh]mm(ss)?|Mo|MM?M?M?|Do|DDDo|DD?D?D?|ddd?d?|do?|w[o|w]?|W[o|W]?|Qo?|YYYYYY|YYYYY|YYYY|YY|gg(ggg?)?|GG(GGG?)?|e|E|a|A|hh?|HH?|kk?|mm?|ss?|S{1,9}|x|X|zz?|ZZ?|.)/g,Kd=/(\[[^\[]*\])|(\\)?(LTS|LT|LL?L?L?|l{1,4})/g,Ld={},Md={},Nd=/\d/,Od=/\d\d/,Pd=/\d{3}/,Qd=/\d{4}/,Rd=/[+-]?\d{6}/,Sd=/\d\d?/,Td=/\d\d\d\d?/,Ud=/\d\d\d\d\d\d?/,Vd=/\d{1,3}/,Wd=/\d{1,4}/,Xd=/[+-]?\d{1,6}/,Yd=/\d+/,Zd=/[+-]?\d+/,$d=/Z|[+-]\d\d:?\d\d/gi,_d=/Z|[+-]\d\d(?::?\d\d)?/gi,ae=/[+-]?\d+(\.\d{1,3})?/,be=/[0-9]*['a-z\u00A0-\u05FF\u0700-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+|[\u0600-\u06FF\/]+(\s*?[\u0600-\u06FF]+){1,2}/i,ce={},de={},ee=0,fe=1,ge=2,he=3,ie=4,je=5,ke=6,le=7,me=8;zd=Array.prototype.indexOf?Array.prototype.indexOf:function(a){var b;for(b=0;b<this.length;++b)if(this[b]===a)return b;return-1};var ne=zd;U("M",["MM",2],"Mo",function(){return this.month()+1}),U("MMM",0,0,function(a){return this.localeData().monthsShort(this,a)}),U("MMMM",0,0,function(a){return this.localeData().months(this,a)}),J("month","M"),M("month",8),Z("M",Sd),Z("MM",Sd,Od),Z("MMM",function(a,b){return b.monthsShortRegex(a)}),Z("MMMM",function(a,b){return b.monthsRegex(a)}),ba(["M","MM"],function(a,b){b[fe]=u(a)-1}),ba(["MMM","MMMM"],function(a,b,c,d){var e=c._locale.monthsParse(a,d,c._strict);null!=e?b[fe]=e:n(c).invalidMonth=a});var oe=/D[oD]?(\[[^\[\]]*\]|\s)+MMMM?/,pe="January_February_March_April_May_June_July_August_September_October_November_December".split("_"),qe="Jan_Feb_Mar_Apr_May_Jun_Jul_Aug_Sep_Oct_Nov_Dec".split("_"),re=be,se=be;U("Y",0,0,function(){var a=this.year();return a<=9999?""+a:"+"+a}),U(0,["YY",2],0,function(){return this.year()%100}),U(0,["YYYY",4],0,"year"),U(0,["YYYYY",5],0,"year"),U(0,["YYYYYY",6,!0],0,"year"),J("year","y"),M("year",1),Z("Y",Zd),Z("YY",Sd,Od),Z("YYYY",Wd,Qd),Z("YYYYY",Xd,Rd),Z("YYYYYY",Xd,Rd),ba(["YYYYY","YYYYYY"],ee),ba("YYYY",function(b,c){c[ee]=2===b.length?a.parseTwoDigitYear(b):u(b)}),ba("YY",function(b,c){c[ee]=a.parseTwoDigitYear(b)}),ba("Y",function(a,b){b[ee]=parseInt(a,10)}),a.parseTwoDigitYear=function(a){return u(a)+(u(a)>68?1900:2e3)};var te=O("FullYear",!0);U("w",["ww",2],"wo","week"),U("W",["WW",2],"Wo","isoWeek"),J("week","w"),J("isoWeek","W"),M("week",5),M("isoWeek",5),Z("w",Sd),Z("ww",Sd,Od),Z("W",Sd),Z("WW",Sd,Od),ca(["w","ww","W","WW"],function(a,b,c,d){b[d.substr(0,1)]=u(a)});var ue={dow:0,doy:6};U("d",0,"do","day"),U("dd",0,0,function(a){return this.localeData().weekdaysMin(this,a)}),U("ddd",0,0,function(a){return this.localeData().weekdaysShort(this,a)}),U("dddd",0,0,function(a){return this.localeData().weekdays(this,a)}),U("e",0,0,"weekday"),U("E",0,0,"isoWeekday"),J("day","d"),J("weekday","e"),J("isoWeekday","E"),M("day",11),M("weekday",11),M("isoWeekday",11),Z("d",Sd),Z("e",Sd),Z("E",Sd),Z("dd",function(a,b){return b.weekdaysMinRegex(a)}),Z("ddd",function(a,b){return b.weekdaysShortRegex(a)}),Z("dddd",function(a,b){return b.weekdaysRegex(a)}),ca(["dd","ddd","dddd"],function(a,b,c,d){var e=c._locale.weekdaysParse(a,d,c._strict);null!=e?b.d=e:n(c).invalidWeekday=a}),ca(["d","e","E"],function(a,b,c,d){b[d]=u(a)});var ve="Sunday_Monday_Tuesday_Wednesday_Thursday_Friday_Saturday".split("_"),we="Sun_Mon_Tue_Wed_Thu_Fri_Sat".split("_"),xe="Su_Mo_Tu_We_Th_Fr_Sa".split("_"),ye=be,ze=be,Ae=be;U("H",["HH",2],0,"hour"),U("h",["hh",2],0,Ra),U("k",["kk",2],0,Sa),U("hmm",0,0,function(){return""+Ra.apply(this)+T(this.minutes(),2)}),U("hmmss",0,0,function(){return""+Ra.apply(this)+T(this.minutes(),2)+T(this.seconds(),2)}),U("Hmm",0,0,function(){return""+this.hours()+T(this.minutes(),2)}),U("Hmmss",0,0,function(){return""+this.hours()+T(this.minutes(),2)+T(this.seconds(),2)}),Ta("a",!0),Ta("A",!1),J("hour","h"),M("hour",13),Z("a",Ua),Z("A",Ua),Z("H",Sd),Z("h",Sd),Z("k",Sd),Z("HH",Sd,Od),Z("hh",Sd,Od),Z("kk",Sd,Od),Z("hmm",Td),Z("hmmss",Ud),Z("Hmm",Td),Z("Hmmss",Ud),ba(["H","HH"],he),ba(["k","kk"],function(a,b,c){var d=u(a);b[he]=24===d?0:d}),ba(["a","A"],function(a,b,c){c._isPm=c._locale.isPM(a),c._meridiem=a}),ba(["h","hh"],function(a,b,c){b[he]=u(a),n(c).bigHour=!0}),ba("hmm",function(a,b,c){var d=a.length-2;b[he]=u(a.substr(0,d)),b[ie]=u(a.substr(d)),n(c).bigHour=!0}),ba("hmmss",function(a,b,c){var d=a.length-4,e=a.length-2;b[he]=u(a.substr(0,d)),b[ie]=u(a.substr(d,2)),b[je]=u(a.substr(e)),n(c).bigHour=!0}),ba("Hmm",function(a,b,c){var d=a.length-2;b[he]=u(a.substr(0,d)),b[ie]=u(a.substr(d))}),ba("Hmmss",function(a,b,c){var d=a.length-4,e=a.length-2;b[he]=u(a.substr(0,d)),b[ie]=u(a.substr(d,2)),b[je]=u(a.substr(e))});var Be,Ce=/[ap]\.?m?\.?/i,De=O("Hours",!0),Ee={calendar:Bd,longDateFormat:Cd,invalidDate:Dd,ordinal:Ed,dayOfMonthOrdinalParse:Fd,relativeTime:Gd,months:pe,monthsShort:qe,week:ue,weekdays:ve,weekdaysMin:xe,weekdaysShort:we,meridiemParse:Ce},Fe={},Ge={},He=/^\s*((?:[+-]\d{6}|\d{4})-(?:\d\d-\d\d|W\d\d-\d|W\d\d|\d\d\d|\d\d))(?:(T| )(\d\d(?::\d\d(?::\d\d(?:[.,]\d+)?)?)?)([\+\-]\d\d(?::?\d\d)?|\s*Z)?)?$/,Ie=/^\s*((?:[+-]\d{6}|\d{4})(?:\d\d\d\d|W\d\d\d|W\d\d|\d\d\d|\d\d))(?:(T| )(\d\d(?:\d\d(?:\d\d(?:[.,]\d+)?)?)?)([\+\-]\d\d(?::?\d\d)?|\s*Z)?)?$/,Je=/Z|[+-]\d\d(?::?\d\d)?/,Ke=[["YYYYYY-MM-DD",/[+-]\d{6}-\d\d-\d\d/],["YYYY-MM-DD",/\d{4}-\d\d-\d\d/],["GGGG-[W]WW-E",/\d{4}-W\d\d-\d/],["GGGG-[W]WW",/\d{4}-W\d\d/,!1],["YYYY-DDD",/\d{4}-\d{3}/],["YYYY-MM",/\d{4}-\d\d/,!1],["YYYYYYMMDD",/[+-]\d{10}/],["YYYYMMDD",/\d{8}/],["GGGG[W]WWE",/\d{4}W\d{3}/],["GGGG[W]WW",/\d{4}W\d{2}/,!1],["YYYYDDD",/\d{7}/]],Le=[["HH:mm:ss.SSSS",/\d\d:\d\d:\d\d\.\d+/],["HH:mm:ss,SSSS",/\d\d:\d\d:\d\d,\d+/],["HH:mm:ss",/\d\d:\d\d:\d\d/],["HH:mm",/\d\d:\d\d/],["HHmmss.SSSS",/\d\d\d\d\d\d\.\d+/],["HHmmss,SSSS",/\d\d\d\d\d\d,\d+/],["HHmmss",/\d\d\d\d\d\d/],["HHmm",/\d\d\d\d/],["HH",/\d\d/]],Me=/^\/?Date\((\-?\d+)/i,Ne=/^((?:Mon|Tue|Wed|Thu|Fri|Sat|Sun),?\s)?(\d?\d\s(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\s(?:\d\d)?\d\d\s)(\d\d:\d\d)(\:\d\d)?(\s(?:UT|GMT|[ECMP][SD]T|[A-IK-Za-ik-z]|[+-]\d{4}))$/;a.createFromInputFallback=x("value provided is not in a recognized RFC2822 or ISO format. moment construction falls back to js Date(), which is not reliable across all browsers and versions. Non RFC2822/ISO date formats are discouraged and will be removed in an upcoming major release. Please refer to http://momentjs.com/guides/#/warnings/js-date/ for more info.",function(a){a._d=new Date(a._i+(a._useUTC?" UTC":""))}),a.ISO_8601=function(){},a.RFC_2822=function(){};var Oe=x("moment().min is deprecated, use moment.max instead. http://momentjs.com/guides/#/warnings/min-max/",function(){var a=tb.apply(null,arguments);return this.isValid()&&a.isValid()?a<this?this:a:p()}),Pe=x("moment().max is deprecated, use moment.min instead. http://momentjs.com/guides/#/warnings/min-max/",function(){var a=tb.apply(null,arguments);return this.isValid()&&a.isValid()?a>this?this:a:p()}),Qe=function(){return Date.now?Date.now():+new Date},Re=["year","quarter","month","week","day","hour","minute","second","millisecond"];Db("Z",":"),Db("ZZ",""),Z("Z",_d),Z("ZZ",_d),ba(["Z","ZZ"],function(a,b,c){c._useUTC=!0,c._tzm=Eb(_d,a)});var Se=/([\+\-]|\d\d)/gi;a.updateOffset=function(){};var Te=/^(\-)?(?:(\d*)[. ])?(\d+)\:(\d+)(?:\:(\d+)(\.\d*)?)?$/,Ue=/^(-)?P(?:(-?[0-9,.]*)Y)?(?:(-?[0-9,.]*)M)?(?:(-?[0-9,.]*)W)?(?:(-?[0-9,.]*)D)?(?:T(?:(-?[0-9,.]*)H)?(?:(-?[0-9,.]*)M)?(?:(-?[0-9,.]*)S)?)?$/;Sb.fn=Ab.prototype,Sb.invalid=zb;var Ve=Wb(1,"add"),We=Wb(-1,"subtract");a.defaultFormat="YYYY-MM-DDTHH:mm:ssZ",a.defaultFormatUtc="YYYY-MM-DDTHH:mm:ss[Z]";var Xe=x("moment().lang() is deprecated. Instead, use moment().localeData() to get the language configuration. Use moment().locale() to change languages.",function(a){return void 0===a?this.localeData():this.locale(a)});U(0,["gg",2],0,function(){return this.weekYear()%100}),U(0,["GG",2],0,function(){return this.isoWeekYear()%100}),Dc("gggg","weekYear"),Dc("ggggg","weekYear"),Dc("GGGG","isoWeekYear"),Dc("GGGGG","isoWeekYear"),J("weekYear","gg"),J("isoWeekYear","GG"),M("weekYear",1),M("isoWeekYear",1),Z("G",Zd),Z("g",Zd),Z("GG",Sd,Od),Z("gg",Sd,Od),Z("GGGG",Wd,Qd),Z("gggg",Wd,Qd),Z("GGGGG",Xd,Rd),Z("ggggg",Xd,Rd),ca(["gggg","ggggg","GGGG","GGGGG"],function(a,b,c,d){b[d.substr(0,2)]=u(a)}),ca(["gg","GG"],function(b,c,d,e){c[e]=a.parseTwoDigitYear(b)}),U("Q",0,"Qo","quarter"),J("quarter","Q"),M("quarter",7),Z("Q",Nd),ba("Q",function(a,b){b[fe]=3*(u(a)-1)}),U("D",["DD",2],"Do","date"),J("date","D"),M("date",9),Z("D",Sd),Z("DD",Sd,Od),Z("Do",function(a,b){return a?b._dayOfMonthOrdinalParse||b._ordinalParse:b._dayOfMonthOrdinalParseLenient}),ba(["D","DD"],ge),ba("Do",function(a,b){b[ge]=u(a.match(Sd)[0],10)});var Ye=O("Date",!0);U("DDD",["DDDD",3],"DDDo","dayOfYear"),J("dayOfYear","DDD"),M("dayOfYear",4),Z("DDD",Vd),Z("DDDD",Pd),ba(["DDD","DDDD"],function(a,b,c){c._dayOfYear=u(a)}),U("m",["mm",2],0,"minute"),J("minute","m"),M("minute",14),Z("m",Sd),Z("mm",Sd,Od),ba(["m","mm"],ie);var Ze=O("Minutes",!1);U("s",["ss",2],0,"second"),J("second","s"),M("second",15),Z("s",Sd),Z("ss",Sd,Od),ba(["s","ss"],je);var $e=O("Seconds",!1);U("S",0,0,function(){return~~(this.millisecond()/100)}),U(0,["SS",2],0,function(){return~~(this.millisecond()/10)}),U(0,["SSS",3],0,"millisecond"),U(0,["SSSS",4],0,function(){return 10*this.millisecond()}),U(0,["SSSSS",5],0,function(){return 100*this.millisecond()}),U(0,["SSSSSS",6],0,function(){return 1e3*this.millisecond()}),U(0,["SSSSSSS",7],0,function(){return 1e4*this.millisecond()}),U(0,["SSSSSSSS",8],0,function(){return 1e5*this.millisecond()}),U(0,["SSSSSSSSS",9],0,function(){return 1e6*this.millisecond()}),J("millisecond","ms"),M("millisecond",16),Z("S",Vd,Nd),Z("SS",Vd,Od),Z("SSS",Vd,Pd);var _e;for(_e="SSSS";_e.length<=9;_e+="S")Z(_e,Yd);for(_e="S";_e.length<=9;_e+="S")ba(_e,Mc);var af=O("Milliseconds",!1);U("z",0,0,"zoneAbbr"),U("zz",0,0,"zoneName");var bf=r.prototype;bf.add=Ve,bf.calendar=Zb,bf.clone=$b,bf.diff=fc,bf.endOf=sc,bf.format=kc,bf.from=lc,bf.fromNow=mc,bf.to=nc,bf.toNow=oc,bf.get=R,bf.invalidAt=Bc,bf.isAfter=_b,bf.isBefore=ac,bf.isBetween=bc,bf.isSame=cc,bf.isSameOrAfter=dc,bf.isSameOrBefore=ec,bf.isValid=zc,bf.lang=Xe,bf.locale=pc,bf.localeData=qc,bf.max=Pe,bf.min=Oe,bf.parsingFlags=Ac,bf.set=S,bf.startOf=rc,bf.subtract=We,bf.toArray=wc,bf.toObject=xc,bf.toDate=vc,bf.toISOString=ic,bf.inspect=jc,bf.toJSON=yc,bf.toString=hc,bf.unix=uc,bf.valueOf=tc,bf.creationData=Cc,bf.year=te,bf.isLeapYear=ra,bf.weekYear=Ec,bf.isoWeekYear=Fc,bf.quarter=bf.quarters=Kc,bf.month=ka,bf.daysInMonth=la,bf.week=bf.weeks=Ba,bf.isoWeek=bf.isoWeeks=Ca,bf.weeksInYear=Hc,bf.isoWeeksInYear=Gc,bf.date=Ye,bf.day=bf.days=Ka,bf.weekday=La,bf.isoWeekday=Ma,bf.dayOfYear=Lc,bf.hour=bf.hours=De,bf.minute=bf.minutes=Ze,bf.second=bf.seconds=$e,bf.millisecond=bf.milliseconds=af,bf.utcOffset=Hb,bf.utc=Jb,bf.local=Kb,bf.parseZone=Lb,bf.hasAlignedHourOffset=Mb,bf.isDST=Nb,bf.isLocal=Pb,bf.isUtcOffset=Qb,bf.isUtc=Rb,bf.isUTC=Rb,bf.zoneAbbr=Nc,bf.zoneName=Oc,bf.dates=x("dates accessor is deprecated. Use date instead.",Ye),bf.months=x("months accessor is deprecated. Use month instead",ka),bf.years=x("years accessor is deprecated. Use year instead",te),bf.zone=x("moment().zone is deprecated, use moment().utcOffset instead. http://momentjs.com/guides/#/warnings/zone/",Ib),bf.isDSTShifted=x("isDSTShifted is deprecated. See http://momentjs.com/guides/#/warnings/dst-shifted/ for more information",Ob);var cf=C.prototype;cf.calendar=D,cf.longDateFormat=E,cf.invalidDate=F,cf.ordinal=G,cf.preparse=Rc,cf.postformat=Rc,cf.relativeTime=H,cf.pastFuture=I,cf.set=A,cf.months=fa,cf.monthsShort=ga,cf.monthsParse=ia,cf.monthsRegex=na,cf.monthsShortRegex=ma,cf.week=ya,cf.firstDayOfYear=Aa,cf.firstDayOfWeek=za,cf.weekdays=Fa,cf.weekdaysMin=Ha,cf.weekdaysShort=Ga,cf.weekdaysParse=Ja,cf.weekdaysRegex=Na,cf.weekdaysShortRegex=Oa,cf.weekdaysMinRegex=Pa,cf.isPM=Va,cf.meridiem=Wa,$a("en",{dayOfMonthOrdinalParse:/\d{1,2}(th|st|nd|rd)/,ordinal:function(a){var b=a%10,c=1===u(a%100/10)?"th":1===b?"st":2===b?"nd":3===b?"rd":"th";return a+c}}),a.lang=x("moment.lang is deprecated. Use moment.locale instead.",$a),a.langData=x("moment.langData is deprecated. Use moment.localeData instead.",bb);var df=Math.abs,ef=id("ms"),ff=id("s"),gf=id("m"),hf=id("h"),jf=id("d"),kf=id("w"),lf=id("M"),mf=id("y"),nf=kd("milliseconds"),of=kd("seconds"),pf=kd("minutes"),qf=kd("hours"),rf=kd("days"),sf=kd("months"),tf=kd("years"),uf=Math.round,vf={ss:44,s:45,m:45,h:22,d:26,M:11},wf=Math.abs,xf=Ab.prototype;return xf.isValid=yb,xf.abs=$c,xf.add=ad,xf.subtract=bd,xf.as=gd,xf.asMilliseconds=ef,xf.asSeconds=ff,xf.asMinutes=gf,xf.asHours=hf,xf.asDays=jf,xf.asWeeks=kf,xf.asMonths=lf,xf.asYears=mf,xf.valueOf=hd,xf._bubble=dd,xf.get=jd,xf.milliseconds=nf,xf.seconds=of,xf.minutes=pf,xf.hours=qf,xf.days=rf,xf.weeks=ld,xf.months=sf,xf.years=tf,xf.humanize=qd,xf.toISOString=rd,xf.toString=rd,xf.toJSON=rd,xf.locale=pc,xf.localeData=qc,xf.toIsoString=x("toIsoString() is deprecated. Please use toISOString() instead (notice the capitals)",rd),xf.lang=Xe,U("X",0,0,"unix"),U("x",0,0,"valueOf"),Z("x",Zd),Z("X",ae),ba("X",function(a,b,c){c._d=new Date(1e3*parseFloat(a,10))}),ba("x",function(a,b,c){c._d=new Date(u(a))}),a.version="2.18.1",b(tb),a.fn=bf,a.min=vb,a.max=wb,a.now=Qe,a.utc=l,a.unix=Pc,a.months=Vc,a.isDate=h,a.locale=$a,a.invalid=p,a.duration=Sb,a.isMoment=s,a.weekdays=Xc,a.parseZone=Qc,a.localeData=bb,a.isDuration=Bb,a.monthsShort=Wc,a.weekdaysMin=Zc,a.defineLocale=_a,a.updateLocale=ab,a.locales=cb,a.weekdaysShort=Yc,a.normalizeUnits=K,a.relativeTimeRounding=od,a.relativeTimeThreshold=pd,a.calendarFormat=Yb,a.prototype=bf,a});

//! moment.js
//! version : 2.18.1
//! authors : Tim Wood, Iskren Chernev, Moment.js contributors
//! license : MIT
//! momentjs.com

;(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? module.exports = factory() :
  typeof define === 'function' && define.amd ? define(factory) :
  global.moment = factory()
}(this, (function () { 'use strict';

var hookCallback;

function hooks () {
  return hookCallback.apply(null, arguments);
}

//This is done to register the method called with moment()
//without creating circular dependencies.
function setHookCallback (callback) {
  hookCallback = callback;
}

function isArray(input) {
  return input instanceof Array || Object.prototype.toString.call(input) === '[object Array]';
}

function isObject(input) {
  // IE8 will treat undefined and null as object if it wasn't for
  // input != null
  return input != null && Object.prototype.toString.call(input) === '[object Object]';
}

function isObjectEmpty(obj) {
  var k;
  for (k in obj) {
      // even if its not own property I'd still call it non-empty
      return false;
  }
  return true;
}

function isUndefined(input) {
  return input === void 0;
}

function isNumber(input) {
  return typeof input === 'number' || Object.prototype.toString.call(input) === '[object Number]';
}

function isDate(input) {
  return input instanceof Date || Object.prototype.toString.call(input) === '[object Date]';
}

function map(arr, fn) {
  var res = [], i;
  for (i = 0; i < arr.length; ++i) {
      res.push(fn(arr[i], i));
  }
  return res;
}

function hasOwnProp(a, b) {
  return Object.prototype.hasOwnProperty.call(a, b);
}

function extend(a, b) {
  for (var i in b) {
      if (hasOwnProp(b, i)) {
          a[i] = b[i];
      }
  }

  if (hasOwnProp(b, 'toString')) {
      a.toString = b.toString;
  }

  if (hasOwnProp(b, 'valueOf')) {
      a.valueOf = b.valueOf;
  }

  return a;
}

function createUTC (input, format, locale, strict) {
  return createLocalOrUTC(input, format, locale, strict, true).utc();
}

function defaultParsingFlags() {
  // We need to deep clone this object.
  return {
      empty           : false,
      unusedTokens    : [],
      unusedInput     : [],
      overflow        : -2,
      charsLeftOver   : 0,
      nullInput       : false,
      invalidMonth    : null,
      invalidFormat   : false,
      userInvalidated : false,
      iso             : false,
      parsedDateParts : [],
      meridiem        : null,
      rfc2822         : false,
      weekdayMismatch : false
  };
}

function getParsingFlags(m) {
  if (m._pf == null) {
      m._pf = defaultParsingFlags();
  }
  return m._pf;
}

var some;
if (Array.prototype.some) {
  some = Array.prototype.some;
} else {
  some = function (fun) {
      var t = Object(this);
      var len = t.length >>> 0;

      for (var i = 0; i < len; i++) {
          if (i in t && fun.call(this, t[i], i, t)) {
              return true;
          }
      }

      return false;
  };
}

var some$1 = some;

function isValid(m) {
  if (m._isValid == null) {
      var flags = getParsingFlags(m);
      var parsedParts = some$1.call(flags.parsedDateParts, function (i) {
          return i != null;
      });
      var isNowValid = !isNaN(m._d.getTime()) &&
          flags.overflow < 0 &&
          !flags.empty &&
          !flags.invalidMonth &&
          !flags.invalidWeekday &&
          !flags.nullInput &&
          !flags.invalidFormat &&
          !flags.userInvalidated &&
          (!flags.meridiem || (flags.meridiem && parsedParts));

      if (m._strict) {
          isNowValid = isNowValid &&
              flags.charsLeftOver === 0 &&
              flags.unusedTokens.length === 0 &&
              flags.bigHour === undefined;
      }

      if (Object.isFrozen == null || !Object.isFrozen(m)) {
          m._isValid = isNowValid;
      }
      else {
          return isNowValid;
      }
  }
  return m._isValid;
}

function createInvalid (flags) {
  var m = createUTC(NaN);
  if (flags != null) {
      extend(getParsingFlags(m), flags);
  }
  else {
      getParsingFlags(m).userInvalidated = true;
  }

  return m;
}

//Plugins that add properties should also add the key here (null value),
//so we can properly clone ourselves.
var momentProperties = hooks.momentProperties = [];

function copyConfig(to, from) {
  var i, prop, val;

  if (!isUndefined(from._isAMomentObject)) {
      to._isAMomentObject = from._isAMomentObject;
  }
  if (!isUndefined(from._i)) {
      to._i = from._i;
  }
  if (!isUndefined(from._f)) {
      to._f = from._f;
  }
  if (!isUndefined(from._l)) {
      to._l = from._l;
  }
  if (!isUndefined(from._strict)) {
      to._strict = from._strict;
  }
  if (!isUndefined(from._tzm)) {
      to._tzm = from._tzm;
  }
  if (!isUndefined(from._isUTC)) {
      to._isUTC = from._isUTC;
  }
  if (!isUndefined(from._offset)) {
      to._offset = from._offset;
  }
  if (!isUndefined(from._pf)) {
      to._pf = getParsingFlags(from);
  }
  if (!isUndefined(from._locale)) {
      to._locale = from._locale;
  }

  if (momentProperties.length > 0) {
      for (i = 0; i < momentProperties.length; i++) {
          prop = momentProperties[i];
          val = from[prop];
          if (!isUndefined(val)) {
              to[prop] = val;
          }
      }
  }

  return to;
}

var updateInProgress = false;

//Moment prototype object
function Moment(config) {
  copyConfig(this, config);
  this._d = new Date(config._d != null ? config._d.getTime() : NaN);
  if (!this.isValid()) {
      this._d = new Date(NaN);
  }
  // Prevent infinite loop in case updateOffset creates new moment
  // objects.
  if (updateInProgress === false) {
      updateInProgress = true;
      hooks.updateOffset(this);
      updateInProgress = false;
  }
}

function isMoment (obj) {
  return obj instanceof Moment || (obj != null && obj._isAMomentObject != null);
}

function absFloor (number) {
  if (number < 0) {
      // -0 -> 0
      return Math.ceil(number) || 0;
  } else {
      return Math.floor(number);
  }
}

function toInt(argumentForCoercion) {
  var coercedNumber = +argumentForCoercion,
      value = 0;

  if (coercedNumber !== 0 && isFinite(coercedNumber)) {
      value = absFloor(coercedNumber);
  }

  return value;
}

//compare two arrays, return the number of differences
function compareArrays(array1, array2, dontConvert) {
  var len = Math.min(array1.length, array2.length),
      lengthDiff = Math.abs(array1.length - array2.length),
      diffs = 0,
      i;
  for (i = 0; i < len; i++) {
      if ((dontConvert && array1[i] !== array2[i]) ||
          (!dontConvert && toInt(array1[i]) !== toInt(array2[i]))) {
          diffs++;
      }
  }
  return diffs + lengthDiff;
}

function warn(msg) {
  if (hooks.suppressDeprecationWarnings === false &&
          (typeof console !==  'undefined') && console.warn) {
      console.warn('Deprecation warning: ' + msg);
  }
}

function deprecate(msg, fn) {
  var firstTime = true;

  return extend(function () {
      if (hooks.deprecationHandler != null) {
          hooks.deprecationHandler(null, msg);
      }
      if (firstTime) {
          var args = [];
          var arg;
          for (var i = 0; i < arguments.length; i++) {
              arg = '';
              if (typeof arguments[i] === 'object') {
                  arg += '\n[' + i + '] ';
                  for (var key in arguments[0]) {
                      arg += key + ': ' + arguments[0][key] + ', ';
                  }
                  arg = arg.slice(0, -2); // Remove trailing comma and space
              } else {
                  arg = arguments[i];
              }
              args.push(arg);
          }
          warn(msg + '\nArguments: ' + Array.prototype.slice.call(args).join('') + '\n' + (new Error()).stack);
          firstTime = false;
      }
      return fn.apply(this, arguments);
  }, fn);
}

var deprecations = {};

function deprecateSimple(name, msg) {
  if (hooks.deprecationHandler != null) {
      hooks.deprecationHandler(name, msg);
  }
  if (!deprecations[name]) {
      warn(msg);
      deprecations[name] = true;
  }
}

hooks.suppressDeprecationWarnings = false;
hooks.deprecationHandler = null;

function isFunction(input) {
  return input instanceof Function || Object.prototype.toString.call(input) === '[object Function]';
}

function set (config) {
  var prop, i;
  for (i in config) {
      prop = config[i];
      if (isFunction(prop)) {
          this[i] = prop;
      } else {
          this['_' + i] = prop;
      }
  }
  this._config = config;
  // Lenient ordinal parsing accepts just a number in addition to
  // number + (possibly) stuff coming from _dayOfMonthOrdinalParse.
  // TODO: Remove "ordinalParse" fallback in next major release.
  this._dayOfMonthOrdinalParseLenient = new RegExp(
      (this._dayOfMonthOrdinalParse.source || this._ordinalParse.source) +
          '|' + (/\d{1,2}/).source);
}

function mergeConfigs(parentConfig, childConfig) {
  var res = extend({}, parentConfig), prop;
  for (prop in childConfig) {
      if (hasOwnProp(childConfig, prop)) {
          if (isObject(parentConfig[prop]) && isObject(childConfig[prop])) {
              res[prop] = {};
              extend(res[prop], parentConfig[prop]);
              extend(res[prop], childConfig[prop]);
          } else if (childConfig[prop] != null) {
              res[prop] = childConfig[prop];
          } else {
              delete res[prop];
          }
      }
  }
  for (prop in parentConfig) {
      if (hasOwnProp(parentConfig, prop) &&
              !hasOwnProp(childConfig, prop) &&
              isObject(parentConfig[prop])) {
          // make sure changes to properties don't modify parent config
          res[prop] = extend({}, res[prop]);
      }
  }
  return res;
}

function Locale(config) {
  if (config != null) {
      this.set(config);
  }
}

var keys;

if (Object.keys) {
  keys = Object.keys;
} else {
  keys = function (obj) {
      var i, res = [];
      for (i in obj) {
          if (hasOwnProp(obj, i)) {
              res.push(i);
          }
      }
      return res;
  };
}

var keys$1 = keys;

var defaultCalendar = {
  sameDay : '[Today at] LT',
  nextDay : '[Tomorrow at] LT',
  nextWeek : 'dddd [at] LT',
  lastDay : '[Yesterday at] LT',
  lastWeek : '[Last] dddd [at] LT',
  sameElse : 'L'
};

function calendar (key, mom, now) {
  var output = this._calendar[key] || this._calendar['sameElse'];
  return isFunction(output) ? output.call(mom, now) : output;
}

var defaultLongDateFormat = {
  LTS  : 'h:mm:ss A',
  LT   : 'h:mm A',
  L    : 'MM/DD/YYYY',
  LL   : 'MMMM D, YYYY',
  LLL  : 'MMMM D, YYYY h:mm A',
  LLLL : 'dddd, MMMM D, YYYY h:mm A'
};

function longDateFormat (key) {
  var format = this._longDateFormat[key],
      formatUpper = this._longDateFormat[key.toUpperCase()];

  if (format || !formatUpper) {
      return format;
  }

  this._longDateFormat[key] = formatUpper.replace(/MMMM|MM|DD|dddd/g, function (val) {
      return val.slice(1);
  });

  return this._longDateFormat[key];
}

var defaultInvalidDate = 'Invalid date';

function invalidDate () {
  return this._invalidDate;
}

var defaultOrdinal = '%d';
var defaultDayOfMonthOrdinalParse = /\d{1,2}/;

function ordinal (number) {
  return this._ordinal.replace('%d', number);
}

var defaultRelativeTime = {
  future : 'in %s',
  past   : '%s ago',
  s  : 'a few seconds',
  ss : '%d seconds',
  m  : 'a minute',
  mm : '%d minutes',
  h  : 'an hour',
  hh : '%d hours',
  d  : 'a day',
  dd : '%d days',
  M  : 'a month',
  MM : '%d months',
  y  : 'a year',
  yy : '%d years'
};

function relativeTime (number, withoutSuffix, string, isFuture) {
  var output = this._relativeTime[string];
  return (isFunction(output)) ?
      output(number, withoutSuffix, string, isFuture) :
      output.replace(/%d/i, number);
}

function pastFuture (diff, output) {
  var format = this._relativeTime[diff > 0 ? 'future' : 'past'];
  return isFunction(format) ? format(output) : format.replace(/%s/i, output);
}

var aliases = {};

function addUnitAlias (unit, shorthand) {
  var lowerCase = unit.toLowerCase();
  aliases[lowerCase] = aliases[lowerCase + 's'] = aliases[shorthand] = unit;
}

function normalizeUnits(units) {
  return typeof units === 'string' ? aliases[units] || aliases[units.toLowerCase()] : undefined;
}

function normalizeObjectUnits(inputObject) {
  var normalizedInput = {},
      normalizedProp,
      prop;

  for (prop in inputObject) {
      if (hasOwnProp(inputObject, prop)) {
          normalizedProp = normalizeUnits(prop);
          if (normalizedProp) {
              normalizedInput[normalizedProp] = inputObject[prop];
          }
      }
  }

  return normalizedInput;
}

var priorities = {};

function addUnitPriority(unit, priority) {
  priorities[unit] = priority;
}

function getPrioritizedUnits(unitsObj) {
  var units = [];
  for (var u in unitsObj) {
      units.push({unit: u, priority: priorities[u]});
  }
  units.sort(function (a, b) {
      return a.priority - b.priority;
  });
  return units;
}

function makeGetSet (unit, keepTime) {
  return function (value) {
      if (value != null) {
          set$1(this, unit, value);
          hooks.updateOffset(this, keepTime);
          return this;
      } else {
          return get(this, unit);
      }
  };
}

function get (mom, unit) {
  return mom.isValid() ?
      mom._d['get' + (mom._isUTC ? 'UTC' : '') + unit]() : NaN;
}

function set$1 (mom, unit, value) {
  if (mom.isValid()) {
      mom._d['set' + (mom._isUTC ? 'UTC' : '') + unit](value);
  }
}

//MOMENTS

function stringGet (units) {
  units = normalizeUnits(units);
  if (isFunction(this[units])) {
      return this[units]();
  }
  return this;
}


function stringSet (units, value) {
  if (typeof units === 'object') {
      units = normalizeObjectUnits(units);
      var prioritized = getPrioritizedUnits(units);
      for (var i = 0; i < prioritized.length; i++) {
          this[prioritized[i].unit](units[prioritized[i].unit]);
      }
  } else {
      units = normalizeUnits(units);
      if (isFunction(this[units])) {
          return this[units](value);
      }
  }
  return this;
}

function zeroFill(number, targetLength, forceSign) {
  var absNumber = '' + Math.abs(number),
      zerosToFill = targetLength - absNumber.length,
      sign = number >= 0;
  return (sign ? (forceSign ? '+' : '') : '-') +
      Math.pow(10, Math.max(0, zerosToFill)).toString().substr(1) + absNumber;
}

var formattingTokens = /(\[[^\[]*\])|(\\)?([Hh]mm(ss)?|Mo|MM?M?M?|Do|DDDo|DD?D?D?|ddd?d?|do?|w[o|w]?|W[o|W]?|Qo?|YYYYYY|YYYYY|YYYY|YY|gg(ggg?)?|GG(GGG?)?|e|E|a|A|hh?|HH?|kk?|mm?|ss?|S{1,9}|x|X|zz?|ZZ?|.)/g;

var localFormattingTokens = /(\[[^\[]*\])|(\\)?(LTS|LT|LL?L?L?|l{1,4})/g;

var formatFunctions = {};

var formatTokenFunctions = {};

//token:    'M'
//padded:   ['MM', 2]
//ordinal:  'Mo'
//callback: function () { this.month() + 1 }
function addFormatToken (token, padded, ordinal, callback) {
  var func = callback;
  if (typeof callback === 'string') {
      func = function () {
          return this[callback]();
      };
  }
  if (token) {
      formatTokenFunctions[token] = func;
  }
  if (padded) {
      formatTokenFunctions[padded[0]] = function () {
          return zeroFill(func.apply(this, arguments), padded[1], padded[2]);
      };
  }
  if (ordinal) {
      formatTokenFunctions[ordinal] = function () {
          return this.localeData().ordinal(func.apply(this, arguments), token);
      };
  }
}

function removeFormattingTokens(input) {
  if (input.match(/\[[\s\S]/)) {
      return input.replace(/^\[|\]$/g, '');
  }
  return input.replace(/\\/g, '');
}

function makeFormatFunction(format) {
  var array = format.match(formattingTokens), i, length;

  for (i = 0, length = array.length; i < length; i++) {
      if (formatTokenFunctions[array[i]]) {
          array[i] = formatTokenFunctions[array[i]];
      } else {
          array[i] = removeFormattingTokens(array[i]);
      }
  }

  return function (mom) {
      var output = '', i;
      for (i = 0; i < length; i++) {
          output += isFunction(array[i]) ? array[i].call(mom, format) : array[i];
      }
      return output;
  };
}

//format date using native date object
function formatMoment(m, format) {
  if (!m.isValid()) {
      return m.localeData().invalidDate();
  }

  format = expandFormat(format, m.localeData());
  formatFunctions[format] = formatFunctions[format] || makeFormatFunction(format);

  return formatFunctions[format](m);
}

function expandFormat(format, locale) {
  var i = 5;

  function replaceLongDateFormatTokens(input) {
      return locale.longDateFormat(input) || input;
  }

  localFormattingTokens.lastIndex = 0;
  while (i >= 0 && localFormattingTokens.test(format)) {
      format = format.replace(localFormattingTokens, replaceLongDateFormatTokens);
      localFormattingTokens.lastIndex = 0;
      i -= 1;
  }

  return format;
}

var match1         = /\d/;            //       0 - 9
var match2         = /\d\d/;          //      00 - 99
var match3         = /\d{3}/;         //     000 - 999
var match4         = /\d{4}/;         //    0000 - 9999
var match6         = /[+-]?\d{6}/;    // -999999 - 999999
var match1to2      = /\d\d?/;         //       0 - 99
var match3to4      = /\d\d\d\d?/;     //     999 - 9999
var match5to6      = /\d\d\d\d\d\d?/; //   99999 - 999999
var match1to3      = /\d{1,3}/;       //       0 - 999
var match1to4      = /\d{1,4}/;       //       0 - 9999
var match1to6      = /[+-]?\d{1,6}/;  // -999999 - 999999

var matchUnsigned  = /\d+/;           //       0 - inf
var matchSigned    = /[+-]?\d+/;      //    -inf - inf

var matchOffset    = /Z|[+-]\d\d:?\d\d/gi; // +00:00 -00:00 +0000 -0000 or Z
var matchShortOffset = /Z|[+-]\d\d(?::?\d\d)?/gi; // +00 -00 +00:00 -00:00 +0000 -0000 or Z

var matchTimestamp = /[+-]?\d+(\.\d{1,3})?/; // 123456789 123456789.123

//any word (or two) characters or numbers including two/three word month in arabic.
//includes scottish gaelic two word and hyphenated months
var matchWord = /[0-9]*['a-z\u00A0-\u05FF\u0700-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+|[\u0600-\u06FF\/]+(\s*?[\u0600-\u06FF]+){1,2}/i;


var regexes = {};

function addRegexToken (token, regex, strictRegex) {
  regexes[token] = isFunction(regex) ? regex : function (isStrict, localeData) {
      return (isStrict && strictRegex) ? strictRegex : regex;
  };
}

function getParseRegexForToken (token, config) {
  if (!hasOwnProp(regexes, token)) {
      return new RegExp(unescapeFormat(token));
  }

  return regexes[token](config._strict, config._locale);
}

//Code from http://stackoverflow.com/questions/3561493/is-there-a-regexp-escape-function-in-javascript
function unescapeFormat(s) {
  return regexEscape(s.replace('\\', '').replace(/\\(\[)|\\(\])|\[([^\]\[]*)\]|\\(.)/g, function (matched, p1, p2, p3, p4) {
      return p1 || p2 || p3 || p4;
  }));
}

function regexEscape(s) {
  return s.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
}

var tokens = {};

function addParseToken (token, callback) {
  var i, func = callback;
  if (typeof token === 'string') {
      token = [token];
  }
  if (isNumber(callback)) {
      func = function (input, array) {
          array[callback] = toInt(input);
      };
  }
  for (i = 0; i < token.length; i++) {
      tokens[token[i]] = func;
  }
}

function addWeekParseToken (token, callback) {
  addParseToken(token, function (input, array, config, token) {
      config._w = config._w || {};
      callback(input, config._w, config, token);
  });
}

function addTimeToArrayFromToken(token, input, config) {
  if (input != null && hasOwnProp(tokens, token)) {
      tokens[token](input, config._a, config, token);
  }
}

var YEAR = 0;
var MONTH = 1;
var DATE = 2;
var HOUR = 3;
var MINUTE = 4;
var SECOND = 5;
var MILLISECOND = 6;
var WEEK = 7;
var WEEKDAY = 8;

var indexOf;

if (Array.prototype.indexOf) {
  indexOf = Array.prototype.indexOf;
} else {
  indexOf = function (o) {
      // I know
      var i;
      for (i = 0; i < this.length; ++i) {
          if (this[i] === o) {
              return i;
          }
      }
      return -1;
  };
}

var indexOf$1 = indexOf;

function daysInMonth(year, month) {
  return new Date(Date.UTC(year, month + 1, 0)).getUTCDate();
}

//FORMATTING

addFormatToken('M', ['MM', 2], 'Mo', function () {
  return this.month() + 1;
});

addFormatToken('MMM', 0, 0, function (format) {
  return this.localeData().monthsShort(this, format);
});

addFormatToken('MMMM', 0, 0, function (format) {
  return this.localeData().months(this, format);
});

//ALIASES

addUnitAlias('month', 'M');

//PRIORITY

addUnitPriority('month', 8);

//PARSING

addRegexToken('M',    match1to2);
addRegexToken('MM',   match1to2, match2);
addRegexToken('MMM',  function (isStrict, locale) {
  return locale.monthsShortRegex(isStrict);
});
addRegexToken('MMMM', function (isStrict, locale) {
  return locale.monthsRegex(isStrict);
});

addParseToken(['M', 'MM'], function (input, array) {
  array[MONTH] = toInt(input) - 1;
});

addParseToken(['MMM', 'MMMM'], function (input, array, config, token) {
  var month = config._locale.monthsParse(input, token, config._strict);
  // if we didn't find a month name, mark the date as invalid.
  if (month != null) {
      array[MONTH] = month;
  } else {
      getParsingFlags(config).invalidMonth = input;
  }
});

//LOCALES

var MONTHS_IN_FORMAT = /D[oD]?(\[[^\[\]]*\]|\s)+MMMM?/;
var defaultLocaleMonths = 'January_February_March_April_May_June_July_August_September_October_November_December'.split('_');
function localeMonths (m, format) {
  if (!m) {
      return isArray(this._months) ? this._months :
          this._months['standalone'];
  }
  return isArray(this._months) ? this._months[m.month()] :
      this._months[(this._months.isFormat || MONTHS_IN_FORMAT).test(format) ? 'format' : 'standalone'][m.month()];
}

var defaultLocaleMonthsShort = 'Jan_Feb_Mar_Apr_May_Jun_Jul_Aug_Sep_Oct_Nov_Dec'.split('_');
function localeMonthsShort (m, format) {
  if (!m) {
      return isArray(this._monthsShort) ? this._monthsShort :
          this._monthsShort['standalone'];
  }
  return isArray(this._monthsShort) ? this._monthsShort[m.month()] :
      this._monthsShort[MONTHS_IN_FORMAT.test(format) ? 'format' : 'standalone'][m.month()];
}

function handleStrictParse(monthName, format, strict) {
  var i, ii, mom, llc = monthName.toLocaleLowerCase();
  if (!this._monthsParse) {
      // this is not used
      this._monthsParse = [];
      this._longMonthsParse = [];
      this._shortMonthsParse = [];
      for (i = 0; i < 12; ++i) {
          mom = createUTC([2000, i]);
          this._shortMonthsParse[i] = this.monthsShort(mom, '').toLocaleLowerCase();
          this._longMonthsParse[i] = this.months(mom, '').toLocaleLowerCase();
      }
  }

  if (strict) {
      if (format === 'MMM') {
          ii = indexOf$1.call(this._shortMonthsParse, llc);
          return ii !== -1 ? ii : null;
      } else {
          ii = indexOf$1.call(this._longMonthsParse, llc);
          return ii !== -1 ? ii : null;
      }
  } else {
      if (format === 'MMM') {
          ii = indexOf$1.call(this._shortMonthsParse, llc);
          if (ii !== -1) {
              return ii;
          }
          ii = indexOf$1.call(this._longMonthsParse, llc);
          return ii !== -1 ? ii : null;
      } else {
          ii = indexOf$1.call(this._longMonthsParse, llc);
          if (ii !== -1) {
              return ii;
          }
          ii = indexOf$1.call(this._shortMonthsParse, llc);
          return ii !== -1 ? ii : null;
      }
  }
}

function localeMonthsParse (monthName, format, strict) {
  var i, mom, regex;

  if (this._monthsParseExact) {
      return handleStrictParse.call(this, monthName, format, strict);
  }

  if (!this._monthsParse) {
      this._monthsParse = [];
      this._longMonthsParse = [];
      this._shortMonthsParse = [];
  }

  // TODO: add sorting
  // Sorting makes sure if one month (or abbr) is a prefix of another
  // see sorting in computeMonthsParse
  for (i = 0; i < 12; i++) {
      // make the regex if we don't have it already
      mom = createUTC([2000, i]);
      if (strict && !this._longMonthsParse[i]) {
          this._longMonthsParse[i] = new RegExp('^' + this.months(mom, '').replace('.', '') + '$', 'i');
          this._shortMonthsParse[i] = new RegExp('^' + this.monthsShort(mom, '').replace('.', '') + '$', 'i');
      }
      if (!strict && !this._monthsParse[i]) {
          regex = '^' + this.months(mom, '') + '|^' + this.monthsShort(mom, '');
          this._monthsParse[i] = new RegExp(regex.replace('.', ''), 'i');
      }
      // test the regex
      if (strict && format === 'MMMM' && this._longMonthsParse[i].test(monthName)) {
          return i;
      } else if (strict && format === 'MMM' && this._shortMonthsParse[i].test(monthName)) {
          return i;
      } else if (!strict && this._monthsParse[i].test(monthName)) {
          return i;
      }
  }
}

//MOMENTS

function setMonth (mom, value) {
  var dayOfMonth;

  if (!mom.isValid()) {
      // No op
      return mom;
  }

  if (typeof value === 'string') {
      if (/^\d+$/.test(value)) {
          value = toInt(value);
      } else {
          value = mom.localeData().monthsParse(value);
          // TODO: Another silent failure?
          if (!isNumber(value)) {
              return mom;
          }
      }
  }

  dayOfMonth = Math.min(mom.date(), daysInMonth(mom.year(), value));
  mom._d['set' + (mom._isUTC ? 'UTC' : '') + 'Month'](value, dayOfMonth);
  return mom;
}

function getSetMonth (value) {
  if (value != null) {
      setMonth(this, value);
      hooks.updateOffset(this, true);
      return this;
  } else {
      return get(this, 'Month');
  }
}

function getDaysInMonth () {
  return daysInMonth(this.year(), this.month());
}

var defaultMonthsShortRegex = matchWord;
function monthsShortRegex (isStrict) {
  if (this._monthsParseExact) {
      if (!hasOwnProp(this, '_monthsRegex')) {
          computeMonthsParse.call(this);
      }
      if (isStrict) {
          return this._monthsShortStrictRegex;
      } else {
          return this._monthsShortRegex;
      }
  } else {
      if (!hasOwnProp(this, '_monthsShortRegex')) {
          this._monthsShortRegex = defaultMonthsShortRegex;
      }
      return this._monthsShortStrictRegex && isStrict ?
          this._monthsShortStrictRegex : this._monthsShortRegex;
  }
}

var defaultMonthsRegex = matchWord;
function monthsRegex (isStrict) {
  if (this._monthsParseExact) {
      if (!hasOwnProp(this, '_monthsRegex')) {
          computeMonthsParse.call(this);
      }
      if (isStrict) {
          return this._monthsStrictRegex;
      } else {
          return this._monthsRegex;
      }
  } else {
      if (!hasOwnProp(this, '_monthsRegex')) {
          this._monthsRegex = defaultMonthsRegex;
      }
      return this._monthsStrictRegex && isStrict ?
          this._monthsStrictRegex : this._monthsRegex;
  }
}

function computeMonthsParse () {
  function cmpLenRev(a, b) {
      return b.length - a.length;
  }

  var shortPieces = [], longPieces = [], mixedPieces = [],
      i, mom;
  for (i = 0; i < 12; i++) {
      // make the regex if we don't have it already
      mom = createUTC([2000, i]);
      shortPieces.push(this.monthsShort(mom, ''));
      longPieces.push(this.months(mom, ''));
      mixedPieces.push(this.months(mom, ''));
      mixedPieces.push(this.monthsShort(mom, ''));
  }
  // Sorting makes sure if one month (or abbr) is a prefix of another it
  // will match the longer piece.
  shortPieces.sort(cmpLenRev);
  longPieces.sort(cmpLenRev);
  mixedPieces.sort(cmpLenRev);
  for (i = 0; i < 12; i++) {
      shortPieces[i] = regexEscape(shortPieces[i]);
      longPieces[i] = regexEscape(longPieces[i]);
  }
  for (i = 0; i < 24; i++) {
      mixedPieces[i] = regexEscape(mixedPieces[i]);
  }

  this._monthsRegex = new RegExp('^(' + mixedPieces.join('|') + ')', 'i');
  this._monthsShortRegex = this._monthsRegex;
  this._monthsStrictRegex = new RegExp('^(' + longPieces.join('|') + ')', 'i');
  this._monthsShortStrictRegex = new RegExp('^(' + shortPieces.join('|') + ')', 'i');
}

//FORMATTING

addFormatToken('Y', 0, 0, function () {
  var y = this.year();
  return y <= 9999 ? '' + y : '+' + y;
});

addFormatToken(0, ['YY', 2], 0, function () {
  return this.year() % 100;
});

addFormatToken(0, ['YYYY',   4],       0, 'year');
addFormatToken(0, ['YYYYY',  5],       0, 'year');
addFormatToken(0, ['YYYYYY', 6, true], 0, 'year');

//ALIASES

addUnitAlias('year', 'y');

//PRIORITIES

addUnitPriority('year', 1);

//PARSING

addRegexToken('Y',      matchSigned);
addRegexToken('YY',     match1to2, match2);
addRegexToken('YYYY',   match1to4, match4);
addRegexToken('YYYYY',  match1to6, match6);
addRegexToken('YYYYYY', match1to6, match6);

addParseToken(['YYYYY', 'YYYYYY'], YEAR);
addParseToken('YYYY', function (input, array) {
  array[YEAR] = input.length === 2 ? hooks.parseTwoDigitYear(input) : toInt(input);
});
addParseToken('YY', function (input, array) {
  array[YEAR] = hooks.parseTwoDigitYear(input);
});
addParseToken('Y', function (input, array) {
  array[YEAR] = parseInt(input, 10);
});

//HELPERS

function daysInYear(year) {
  return isLeapYear(year) ? 366 : 365;
}

function isLeapYear(year) {
  return (year % 4 === 0 && year % 100 !== 0) || year % 400 === 0;
}

//HOOKS

hooks.parseTwoDigitYear = function (input) {
  return toInt(input) + (toInt(input) > 68 ? 1900 : 2000);
};

//MOMENTS

var getSetYear = makeGetSet('FullYear', true);

function getIsLeapYear () {
  return isLeapYear(this.year());
}

function createDate (y, m, d, h, M, s, ms) {
  // can't just apply() to create a date:
  // https://stackoverflow.com/q/181348
  var date = new Date(y, m, d, h, M, s, ms);

  // the date constructor remaps years 0-99 to 1900-1999
  if (y < 100 && y >= 0 && isFinite(date.getFullYear())) {
      date.setFullYear(y);
  }
  return date;
}

function createUTCDate (y) {
  var date = new Date(Date.UTC.apply(null, arguments));

  // the Date.UTC function remaps years 0-99 to 1900-1999
  if (y < 100 && y >= 0 && isFinite(date.getUTCFullYear())) {
      date.setUTCFullYear(y);
  }
  return date;
}

//start-of-first-week - start-of-year
function firstWeekOffset(year, dow, doy) {
  var // first-week day -- which january is always in the first week (4 for iso, 1 for other)
      fwd = 7 + dow - doy,
      // first-week day local weekday -- which local weekday is fwd
      fwdlw = (7 + createUTCDate(year, 0, fwd).getUTCDay() - dow) % 7;

  return -fwdlw + fwd - 1;
}

//https://en.wikipedia.org/wiki/ISO_week_date#Calculating_a_date_given_the_year.2C_week_number_and_weekday
function dayOfYearFromWeeks(year, week, weekday, dow, doy) {
  var localWeekday = (7 + weekday - dow) % 7,
      weekOffset = firstWeekOffset(year, dow, doy),
      dayOfYear = 1 + 7 * (week - 1) + localWeekday + weekOffset,
      resYear, resDayOfYear;

  if (dayOfYear <= 0) {
      resYear = year - 1;
      resDayOfYear = daysInYear(resYear) + dayOfYear;
  } else if (dayOfYear > daysInYear(year)) {
      resYear = year + 1;
      resDayOfYear = dayOfYear - daysInYear(year);
  } else {
      resYear = year;
      resDayOfYear = dayOfYear;
  }

  return {
      year: resYear,
      dayOfYear: resDayOfYear
  };
}

function weekOfYear(mom, dow, doy) {
  var weekOffset = firstWeekOffset(mom.year(), dow, doy),
      week = Math.floor((mom.dayOfYear() - weekOffset - 1) / 7) + 1,
      resWeek, resYear;

  if (week < 1) {
      resYear = mom.year() - 1;
      resWeek = week + weeksInYear(resYear, dow, doy);
  } else if (week > weeksInYear(mom.year(), dow, doy)) {
      resWeek = week - weeksInYear(mom.year(), dow, doy);
      resYear = mom.year() + 1;
  } else {
      resYear = mom.year();
      resWeek = week;
  }

  return {
      week: resWeek,
      year: resYear
  };
}

function weeksInYear(year, dow, doy) {
  var weekOffset = firstWeekOffset(year, dow, doy),
      weekOffsetNext = firstWeekOffset(year + 1, dow, doy);
  return (daysInYear(year) - weekOffset + weekOffsetNext) / 7;
}

//FORMATTING

addFormatToken('w', ['ww', 2], 'wo', 'week');
addFormatToken('W', ['WW', 2], 'Wo', 'isoWeek');

//ALIASES

addUnitAlias('week', 'w');
addUnitAlias('isoWeek', 'W');

//PRIORITIES

addUnitPriority('week', 5);
addUnitPriority('isoWeek', 5);

//PARSING

addRegexToken('w',  match1to2);
addRegexToken('ww', match1to2, match2);
addRegexToken('W',  match1to2);
addRegexToken('WW', match1to2, match2);

addWeekParseToken(['w', 'ww', 'W', 'WW'], function (input, week, config, token) {
  week[token.substr(0, 1)] = toInt(input);
});

//HELPERS

//LOCALES

function localeWeek (mom) {
  return weekOfYear(mom, this._week.dow, this._week.doy).week;
}

var defaultLocaleWeek = {
  dow : 0, // Sunday is the first day of the week.
  doy : 6  // The week that contains Jan 1st is the first week of the year.
};

function localeFirstDayOfWeek () {
  return this._week.dow;
}

function localeFirstDayOfYear () {
  return this._week.doy;
}

//MOMENTS

function getSetWeek (input) {
  var week = this.localeData().week(this);
  return input == null ? week : this.add((input - week) * 7, 'd');
}

function getSetISOWeek (input) {
  var week = weekOfYear(this, 1, 4).week;
  return input == null ? week : this.add((input - week) * 7, 'd');
}

//FORMATTING

addFormatToken('d', 0, 'do', 'day');

addFormatToken('dd', 0, 0, function (format) {
  return this.localeData().weekdaysMin(this, format);
});

addFormatToken('ddd', 0, 0, function (format) {
  return this.localeData().weekdaysShort(this, format);
});

addFormatToken('dddd', 0, 0, function (format) {
  return this.localeData().weekdays(this, format);
});

addFormatToken('e', 0, 0, 'weekday');
addFormatToken('E', 0, 0, 'isoWeekday');

//ALIASES

addUnitAlias('day', 'd');
addUnitAlias('weekday', 'e');
addUnitAlias('isoWeekday', 'E');

//PRIORITY
addUnitPriority('day', 11);
addUnitPriority('weekday', 11);
addUnitPriority('isoWeekday', 11);

//PARSING

addRegexToken('d',    match1to2);
addRegexToken('e',    match1to2);
addRegexToken('E',    match1to2);
addRegexToken('dd',   function (isStrict, locale) {
  return locale.weekdaysMinRegex(isStrict);
});
addRegexToken('ddd',   function (isStrict, locale) {
  return locale.weekdaysShortRegex(isStrict);
});
addRegexToken('dddd',   function (isStrict, locale) {
  return locale.weekdaysRegex(isStrict);
});

addWeekParseToken(['dd', 'ddd', 'dddd'], function (input, week, config, token) {
  var weekday = config._locale.weekdaysParse(input, token, config._strict);
  // if we didn't get a weekday name, mark the date as invalid
  if (weekday != null) {
      week.d = weekday;
  } else {
      getParsingFlags(config).invalidWeekday = input;
  }
});

addWeekParseToken(['d', 'e', 'E'], function (input, week, config, token) {
  week[token] = toInt(input);
});

//HELPERS

function parseWeekday(input, locale) {
  if (typeof input !== 'string') {
      return input;
  }

  if (!isNaN(input)) {
      return parseInt(input, 10);
  }

  input = locale.weekdaysParse(input);
  if (typeof input === 'number') {
      return input;
  }

  return null;
}

function parseIsoWeekday(input, locale) {
  if (typeof input === 'string') {
      return locale.weekdaysParse(input) % 7 || 7;
  }
  return isNaN(input) ? null : input;
}

//LOCALES

var defaultLocaleWeekdays = 'Sunday_Monday_Tuesday_Wednesday_Thursday_Friday_Saturday'.split('_');
function localeWeekdays (m, format) {
  if (!m) {
      return isArray(this._weekdays) ? this._weekdays :
          this._weekdays['standalone'];
  }
  return isArray(this._weekdays) ? this._weekdays[m.day()] :
      this._weekdays[this._weekdays.isFormat.test(format) ? 'format' : 'standalone'][m.day()];
}

var defaultLocaleWeekdaysShort = 'Sun_Mon_Tue_Wed_Thu_Fri_Sat'.split('_');
function localeWeekdaysShort (m) {
  return (m) ? this._weekdaysShort[m.day()] : this._weekdaysShort;
}

var defaultLocaleWeekdaysMin = 'Su_Mo_Tu_We_Th_Fr_Sa'.split('_');
function localeWeekdaysMin (m) {
  return (m) ? this._weekdaysMin[m.day()] : this._weekdaysMin;
}

function handleStrictParse$1(weekdayName, format, strict) {
  var i, ii, mom, llc = weekdayName.toLocaleLowerCase();
  if (!this._weekdaysParse) {
      this._weekdaysParse = [];
      this._shortWeekdaysParse = [];
      this._minWeekdaysParse = [];

      for (i = 0; i < 7; ++i) {
          mom = createUTC([2000, 1]).day(i);
          this._minWeekdaysParse[i] = this.weekdaysMin(mom, '').toLocaleLowerCase();
          this._shortWeekdaysParse[i] = this.weekdaysShort(mom, '').toLocaleLowerCase();
          this._weekdaysParse[i] = this.weekdays(mom, '').toLocaleLowerCase();
      }
  }

  if (strict) {
      if (format === 'dddd') {
          ii = indexOf$1.call(this._weekdaysParse, llc);
          return ii !== -1 ? ii : null;
      } else if (format === 'ddd') {
          ii = indexOf$1.call(this._shortWeekdaysParse, llc);
          return ii !== -1 ? ii : null;
      } else {
          ii = indexOf$1.call(this._minWeekdaysParse, llc);
          return ii !== -1 ? ii : null;
      }
  } else {
      if (format === 'dddd') {
          ii = indexOf$1.call(this._weekdaysParse, llc);
          if (ii !== -1) {
              return ii;
          }
          ii = indexOf$1.call(this._shortWeekdaysParse, llc);
          if (ii !== -1) {
              return ii;
          }
          ii = indexOf$1.call(this._minWeekdaysParse, llc);
          return ii !== -1 ? ii : null;
      } else if (format === 'ddd') {
          ii = indexOf$1.call(this._shortWeekdaysParse, llc);
          if (ii !== -1) {
              return ii;
          }
          ii = indexOf$1.call(this._weekdaysParse, llc);
          if (ii !== -1) {
              return ii;
          }
          ii = indexOf$1.call(this._minWeekdaysParse, llc);
          return ii !== -1 ? ii : null;
      } else {
          ii = indexOf$1.call(this._minWeekdaysParse, llc);
          if (ii !== -1) {
              return ii;
          }
          ii = indexOf$1.call(this._weekdaysParse, llc);
          if (ii !== -1) {
              return ii;
          }
          ii = indexOf$1.call(this._shortWeekdaysParse, llc);
          return ii !== -1 ? ii : null;
      }
  }
}

function localeWeekdaysParse (weekdayName, format, strict) {
  var i, mom, regex;

  if (this._weekdaysParseExact) {
      return handleStrictParse$1.call(this, weekdayName, format, strict);
  }

  if (!this._weekdaysParse) {
      this._weekdaysParse = [];
      this._minWeekdaysParse = [];
      this._shortWeekdaysParse = [];
      this._fullWeekdaysParse = [];
  }

  for (i = 0; i < 7; i++) {
      // make the regex if we don't have it already

      mom = createUTC([2000, 1]).day(i);
      if (strict && !this._fullWeekdaysParse[i]) {
          this._fullWeekdaysParse[i] = new RegExp('^' + this.weekdays(mom, '').replace('.', '\.?') + '$', 'i');
          this._shortWeekdaysParse[i] = new RegExp('^' + this.weekdaysShort(mom, '').replace('.', '\.?') + '$', 'i');
          this._minWeekdaysParse[i] = new RegExp('^' + this.weekdaysMin(mom, '').replace('.', '\.?') + '$', 'i');
      }
      if (!this._weekdaysParse[i]) {
          regex = '^' + this.weekdays(mom, '') + '|^' + this.weekdaysShort(mom, '') + '|^' + this.weekdaysMin(mom, '');
          this._weekdaysParse[i] = new RegExp(regex.replace('.', ''), 'i');
      }
      // test the regex
      if (strict && format === 'dddd' && this._fullWeekdaysParse[i].test(weekdayName)) {
          return i;
      } else if (strict && format === 'ddd' && this._shortWeekdaysParse[i].test(weekdayName)) {
          return i;
      } else if (strict && format === 'dd' && this._minWeekdaysParse[i].test(weekdayName)) {
          return i;
      } else if (!strict && this._weekdaysParse[i].test(weekdayName)) {
          return i;
      }
  }
}

//MOMENTS

function getSetDayOfWeek (input) {
  if (!this.isValid()) {
      return input != null ? this : NaN;
  }
  var day = this._isUTC ? this._d.getUTCDay() : this._d.getDay();
  if (input != null) {
      input = parseWeekday(input, this.localeData());
      return this.add(input - day, 'd');
  } else {
      return day;
  }
}

function getSetLocaleDayOfWeek (input) {
  if (!this.isValid()) {
      return input != null ? this : NaN;
  }
  var weekday = (this.day() + 7 - this.localeData()._week.dow) % 7;
  return input == null ? weekday : this.add(input - weekday, 'd');
}

function getSetISODayOfWeek (input) {
  if (!this.isValid()) {
      return input != null ? this : NaN;
  }

  // behaves the same as moment#day except
  // as a getter, returns 7 instead of 0 (1-7 range instead of 0-6)
  // as a setter, sunday should belong to the previous week.

  if (input != null) {
      var weekday = parseIsoWeekday(input, this.localeData());
      return this.day(this.day() % 7 ? weekday : weekday - 7);
  } else {
      return this.day() || 7;
  }
}

var defaultWeekdaysRegex = matchWord;
function weekdaysRegex (isStrict) {
  if (this._weekdaysParseExact) {
      if (!hasOwnProp(this, '_weekdaysRegex')) {
          computeWeekdaysParse.call(this);
      }
      if (isStrict) {
          return this._weekdaysStrictRegex;
      } else {
          return this._weekdaysRegex;
      }
  } else {
      if (!hasOwnProp(this, '_weekdaysRegex')) {
          this._weekdaysRegex = defaultWeekdaysRegex;
      }
      return this._weekdaysStrictRegex && isStrict ?
          this._weekdaysStrictRegex : this._weekdaysRegex;
  }
}

var defaultWeekdaysShortRegex = matchWord;
function weekdaysShortRegex (isStrict) {
  if (this._weekdaysParseExact) {
      if (!hasOwnProp(this, '_weekdaysRegex')) {
          computeWeekdaysParse.call(this);
      }
      if (isStrict) {
          return this._weekdaysShortStrictRegex;
      } else {
          return this._weekdaysShortRegex;
      }
  } else {
      if (!hasOwnProp(this, '_weekdaysShortRegex')) {
          this._weekdaysShortRegex = defaultWeekdaysShortRegex;
      }
      return this._weekdaysShortStrictRegex && isStrict ?
          this._weekdaysShortStrictRegex : this._weekdaysShortRegex;
  }
}

var defaultWeekdaysMinRegex = matchWord;
function weekdaysMinRegex (isStrict) {
  if (this._weekdaysParseExact) {
      if (!hasOwnProp(this, '_weekdaysRegex')) {
          computeWeekdaysParse.call(this);
      }
      if (isStrict) {
          return this._weekdaysMinStrictRegex;
      } else {
          return this._weekdaysMinRegex;
      }
  } else {
      if (!hasOwnProp(this, '_weekdaysMinRegex')) {
          this._weekdaysMinRegex = defaultWeekdaysMinRegex;
      }
      return this._weekdaysMinStrictRegex && isStrict ?
          this._weekdaysMinStrictRegex : this._weekdaysMinRegex;
  }
}


function computeWeekdaysParse () {
  function cmpLenRev(a, b) {
      return b.length - a.length;
  }

  var minPieces = [], shortPieces = [], longPieces = [], mixedPieces = [],
      i, mom, minp, shortp, longp;
  for (i = 0; i < 7; i++) {
      // make the regex if we don't have it already
      mom = createUTC([2000, 1]).day(i);
      minp = this.weekdaysMin(mom, '');
      shortp = this.weekdaysShort(mom, '');
      longp = this.weekdays(mom, '');
      minPieces.push(minp);
      shortPieces.push(shortp);
      longPieces.push(longp);
      mixedPieces.push(minp);
      mixedPieces.push(shortp);
      mixedPieces.push(longp);
  }
  // Sorting makes sure if one weekday (or abbr) is a prefix of another it
  // will match the longer piece.
  minPieces.sort(cmpLenRev);
  shortPieces.sort(cmpLenRev);
  longPieces.sort(cmpLenRev);
  mixedPieces.sort(cmpLenRev);
  for (i = 0; i < 7; i++) {
      shortPieces[i] = regexEscape(shortPieces[i]);
      longPieces[i] = regexEscape(longPieces[i]);
      mixedPieces[i] = regexEscape(mixedPieces[i]);
  }

  this._weekdaysRegex = new RegExp('^(' + mixedPieces.join('|') + ')', 'i');
  this._weekdaysShortRegex = this._weekdaysRegex;
  this._weekdaysMinRegex = this._weekdaysRegex;

  this._weekdaysStrictRegex = new RegExp('^(' + longPieces.join('|') + ')', 'i');
  this._weekdaysShortStrictRegex = new RegExp('^(' + shortPieces.join('|') + ')', 'i');
  this._weekdaysMinStrictRegex = new RegExp('^(' + minPieces.join('|') + ')', 'i');
}

//FORMATTING

function hFormat() {
  return this.hours() % 12 || 12;
}

function kFormat() {
  return this.hours() || 24;
}

addFormatToken('H', ['HH', 2], 0, 'hour');
addFormatToken('h', ['hh', 2], 0, hFormat);
addFormatToken('k', ['kk', 2], 0, kFormat);

addFormatToken('hmm', 0, 0, function () {
  return '' + hFormat.apply(this) + zeroFill(this.minutes(), 2);
});

addFormatToken('hmmss', 0, 0, function () {
  return '' + hFormat.apply(this) + zeroFill(this.minutes(), 2) +
      zeroFill(this.seconds(), 2);
});

addFormatToken('Hmm', 0, 0, function () {
  return '' + this.hours() + zeroFill(this.minutes(), 2);
});

addFormatToken('Hmmss', 0, 0, function () {
  return '' + this.hours() + zeroFill(this.minutes(), 2) +
      zeroFill(this.seconds(), 2);
});

function meridiem (token, lowercase) {
  addFormatToken(token, 0, 0, function () {
      return this.localeData().meridiem(this.hours(), this.minutes(), lowercase);
  });
}

meridiem('a', true);
meridiem('A', false);

//ALIASES

addUnitAlias('hour', 'h');

//PRIORITY
addUnitPriority('hour', 13);

//PARSING

function matchMeridiem (isStrict, locale) {
  return locale._meridiemParse;
}

addRegexToken('a',  matchMeridiem);
addRegexToken('A',  matchMeridiem);
addRegexToken('H',  match1to2);
addRegexToken('h',  match1to2);
addRegexToken('k',  match1to2);
addRegexToken('HH', match1to2, match2);
addRegexToken('hh', match1to2, match2);
addRegexToken('kk', match1to2, match2);

addRegexToken('hmm', match3to4);
addRegexToken('hmmss', match5to6);
addRegexToken('Hmm', match3to4);
addRegexToken('Hmmss', match5to6);

addParseToken(['H', 'HH'], HOUR);
addParseToken(['k', 'kk'], function (input, array, config) {
  var kInput = toInt(input);
  array[HOUR] = kInput === 24 ? 0 : kInput;
});
addParseToken(['a', 'A'], function (input, array, config) {
  config._isPm = config._locale.isPM(input);
  config._meridiem = input;
});
addParseToken(['h', 'hh'], function (input, array, config) {
  array[HOUR] = toInt(input);
  getParsingFlags(config).bigHour = true;
});
addParseToken('hmm', function (input, array, config) {
  var pos = input.length - 2;
  array[HOUR] = toInt(input.substr(0, pos));
  array[MINUTE] = toInt(input.substr(pos));
  getParsingFlags(config).bigHour = true;
});
addParseToken('hmmss', function (input, array, config) {
  var pos1 = input.length - 4;
  var pos2 = input.length - 2;
  array[HOUR] = toInt(input.substr(0, pos1));
  array[MINUTE] = toInt(input.substr(pos1, 2));
  array[SECOND] = toInt(input.substr(pos2));
  getParsingFlags(config).bigHour = true;
});
addParseToken('Hmm', function (input, array, config) {
  var pos = input.length - 2;
  array[HOUR] = toInt(input.substr(0, pos));
  array[MINUTE] = toInt(input.substr(pos));
});
addParseToken('Hmmss', function (input, array, config) {
  var pos1 = input.length - 4;
  var pos2 = input.length - 2;
  array[HOUR] = toInt(input.substr(0, pos1));
  array[MINUTE] = toInt(input.substr(pos1, 2));
  array[SECOND] = toInt(input.substr(pos2));
});

//LOCALES

function localeIsPM (input) {
  // IE8 Quirks Mode & IE7 Standards Mode do not allow accessing strings like arrays
  // Using charAt should be more compatible.
  return ((input + '').toLowerCase().charAt(0) === 'p');
}

var defaultLocaleMeridiemParse = /[ap]\.?m?\.?/i;
function localeMeridiem (hours, minutes, isLower) {
  if (hours > 11) {
      return isLower ? 'pm' : 'PM';
  } else {
      return isLower ? 'am' : 'AM';
  }
}


//MOMENTS

//Setting the hour should keep the time, because the user explicitly
//specified which hour he wants. So trying to maintain the same hour (in
//a new timezone) makes sense. Adding/subtracting hours does not follow
//this rule.
var getSetHour = makeGetSet('Hours', true);

//months
//week
//weekdays
//meridiem
var baseConfig = {
  calendar: defaultCalendar,
  longDateFormat: defaultLongDateFormat,
  invalidDate: defaultInvalidDate,
  ordinal: defaultOrdinal,
  dayOfMonthOrdinalParse: defaultDayOfMonthOrdinalParse,
  relativeTime: defaultRelativeTime,

  months: defaultLocaleMonths,
  monthsShort: defaultLocaleMonthsShort,

  week: defaultLocaleWeek,

  weekdays: defaultLocaleWeekdays,
  weekdaysMin: defaultLocaleWeekdaysMin,
  weekdaysShort: defaultLocaleWeekdaysShort,

  meridiemParse: defaultLocaleMeridiemParse
};

//internal storage for locale config files
var locales = {};
var localeFamilies = {};
var globalLocale;

function normalizeLocale(key) {
  return key ? key.toLowerCase().replace('_', '-') : key;
}

//pick the locale from the array
//try ['en-au', 'en-gb'] as 'en-au', 'en-gb', 'en', as in move through the list trying each
//substring from most specific to least, but move to the next array item if it's a more specific variant than the current root
function chooseLocale(names) {
  var i = 0, j, next, locale, split;

  while (i < names.length) {
      split = normalizeLocale(names[i]).split('-');
      j = split.length;
      next = normalizeLocale(names[i + 1]);
      next = next ? next.split('-') : null;
      while (j > 0) {
          locale = loadLocale(split.slice(0, j).join('-'));
          if (locale) {
              return locale;
          }
          if (next && next.length >= j && compareArrays(split, next, true) >= j - 1) {
              //the next array item is better than a shallower substring of this one
              break;
          }
          j--;
      }
      i++;
  }
  return null;
}

function loadLocale(name) {
  var oldLocale = null;
  // TODO: Find a better way to register and load all the locales in Node
  if (!locales[name] && (typeof module !== 'undefined') &&
          module && module.exports) {
      try {
          oldLocale = globalLocale._abbr;
          require('./locale/' + name);
          // because defineLocale currently also sets the global locale, we
          // want to undo that for lazy loaded locales
          getSetGlobalLocale(oldLocale);
      } catch (e) { }
  }
  return locales[name];
}

//This function will load locale and then set the global locale.  If
//no arguments are passed in, it will simply return the current global
//locale key.
function getSetGlobalLocale (key, values) {
  var data;
  if (key) {
      if (isUndefined(values)) {
          data = getLocale(key);
      }
      else {
          data = defineLocale(key, values);
      }

      if (data) {
          // moment.duration._locale = moment._locale = data;
          globalLocale = data;
      }
  }

  return globalLocale._abbr;
}

function defineLocale (name, config) {
  if (config !== null) {
      var parentConfig = baseConfig;
      config.abbr = name;
      if (locales[name] != null) {
          deprecateSimple('defineLocaleOverride',
                  'use moment.updateLocale(localeName, config) to change ' +
                  'an existing locale. moment.defineLocale(localeName, ' +
                  'config) should only be used for creating a new locale ' +
                  'See http://momentjs.com/guides/#/warnings/define-locale/ for more info.');
          parentConfig = locales[name]._config;
      } else if (config.parentLocale != null) {
          if (locales[config.parentLocale] != null) {
              parentConfig = locales[config.parentLocale]._config;
          } else {
              if (!localeFamilies[config.parentLocale]) {
                  localeFamilies[config.parentLocale] = [];
              }
              localeFamilies[config.parentLocale].push({
                  name: name,
                  config: config
              });
              return null;
          }
      }
      locales[name] = new Locale(mergeConfigs(parentConfig, config));

      if (localeFamilies[name]) {
          localeFamilies[name].forEach(function (x) {
              defineLocale(x.name, x.config);
          });
      }

      // backwards compat for now: also set the locale
      // make sure we set the locale AFTER all child locales have been
      // created, so we won't end up with the child locale set.
      getSetGlobalLocale(name);


      return locales[name];
  } else {
      // useful for testing
      delete locales[name];
      return null;
  }
}

function updateLocale(name, config) {
  if (config != null) {
      var locale, parentConfig = baseConfig;
      // MERGE
      if (locales[name] != null) {
          parentConfig = locales[name]._config;
      }
      config = mergeConfigs(parentConfig, config);
      locale = new Locale(config);
      locale.parentLocale = locales[name];
      locales[name] = locale;

      // backwards compat for now: also set the locale
      getSetGlobalLocale(name);
  } else {
      // pass null for config to unupdate, useful for tests
      if (locales[name] != null) {
          if (locales[name].parentLocale != null) {
              locales[name] = locales[name].parentLocale;
          } else if (locales[name] != null) {
              delete locales[name];
          }
      }
  }
  return locales[name];
}

//returns locale data
function getLocale (key) {
  var locale;

  if (key && key._locale && key._locale._abbr) {
      key = key._locale._abbr;
  }

  if (!key) {
      return globalLocale;
  }

  if (!isArray(key)) {
      //short-circuit everything else
      locale = loadLocale(key);
      if (locale) {
          return locale;
      }
      key = [key];
  }

  return chooseLocale(key);
}

function listLocales() {
  return keys$1(locales);
}

function checkOverflow (m) {
  var overflow;
  var a = m._a;

  if (a && getParsingFlags(m).overflow === -2) {
      overflow =
          a[MONTH]       < 0 || a[MONTH]       > 11  ? MONTH :
          a[DATE]        < 1 || a[DATE]        > daysInMonth(a[YEAR], a[MONTH]) ? DATE :
          a[HOUR]        < 0 || a[HOUR]        > 24 || (a[HOUR] === 24 && (a[MINUTE] !== 0 || a[SECOND] !== 0 || a[MILLISECOND] !== 0)) ? HOUR :
          a[MINUTE]      < 0 || a[MINUTE]      > 59  ? MINUTE :
          a[SECOND]      < 0 || a[SECOND]      > 59  ? SECOND :
          a[MILLISECOND] < 0 || a[MILLISECOND] > 999 ? MILLISECOND :
          -1;

      if (getParsingFlags(m)._overflowDayOfYear && (overflow < YEAR || overflow > DATE)) {
          overflow = DATE;
      }
      if (getParsingFlags(m)._overflowWeeks && overflow === -1) {
          overflow = WEEK;
      }
      if (getParsingFlags(m)._overflowWeekday && overflow === -1) {
          overflow = WEEKDAY;
      }

      getParsingFlags(m).overflow = overflow;
  }

  return m;
}

//iso 8601 regex
//0000-00-00 0000-W00 or 0000-W00-0 + T + 00 or 00:00 or 00:00:00 or 00:00:00.000 + +00:00 or +0000 or +00)
var extendedIsoRegex = /^\s*((?:[+-]\d{6}|\d{4})-(?:\d\d-\d\d|W\d\d-\d|W\d\d|\d\d\d|\d\d))(?:(T| )(\d\d(?::\d\d(?::\d\d(?:[.,]\d+)?)?)?)([\+\-]\d\d(?::?\d\d)?|\s*Z)?)?$/;
var basicIsoRegex = /^\s*((?:[+-]\d{6}|\d{4})(?:\d\d\d\d|W\d\d\d|W\d\d|\d\d\d|\d\d))(?:(T| )(\d\d(?:\d\d(?:\d\d(?:[.,]\d+)?)?)?)([\+\-]\d\d(?::?\d\d)?|\s*Z)?)?$/;

var tzRegex = /Z|[+-]\d\d(?::?\d\d)?/;

var isoDates = [
  ['YYYYYY-MM-DD', /[+-]\d{6}-\d\d-\d\d/],
  ['YYYY-MM-DD', /\d{4}-\d\d-\d\d/],
  ['GGGG-[W]WW-E', /\d{4}-W\d\d-\d/],
  ['GGGG-[W]WW', /\d{4}-W\d\d/, false],
  ['YYYY-DDD', /\d{4}-\d{3}/],
  ['YYYY-MM', /\d{4}-\d\d/, false],
  ['YYYYYYMMDD', /[+-]\d{10}/],
  ['YYYYMMDD', /\d{8}/],
  // YYYYMM is NOT allowed by the standard
  ['GGGG[W]WWE', /\d{4}W\d{3}/],
  ['GGGG[W]WW', /\d{4}W\d{2}/, false],
  ['YYYYDDD', /\d{7}/]
];

//iso time formats and regexes
var isoTimes = [
  ['HH:mm:ss.SSSS', /\d\d:\d\d:\d\d\.\d+/],
  ['HH:mm:ss,SSSS', /\d\d:\d\d:\d\d,\d+/],
  ['HH:mm:ss', /\d\d:\d\d:\d\d/],
  ['HH:mm', /\d\d:\d\d/],
  ['HHmmss.SSSS', /\d\d\d\d\d\d\.\d+/],
  ['HHmmss,SSSS', /\d\d\d\d\d\d,\d+/],
  ['HHmmss', /\d\d\d\d\d\d/],
  ['HHmm', /\d\d\d\d/],
  ['HH', /\d\d/]
];

var aspNetJsonRegex = /^\/?Date\((\-?\d+)/i;

//date from iso format
function configFromISO(config) {
  var i, l,
      string = config._i,
      match = extendedIsoRegex.exec(string) || basicIsoRegex.exec(string),
      allowTime, dateFormat, timeFormat, tzFormat;

  if (match) {
      getParsingFlags(config).iso = true;

      for (i = 0, l = isoDates.length; i < l; i++) {
          if (isoDates[i][1].exec(match[1])) {
              dateFormat = isoDates[i][0];
              allowTime = isoDates[i][2] !== false;
              break;
          }
      }
      if (dateFormat == null) {
          config._isValid = false;
          return;
      }
      if (match[3]) {
          for (i = 0, l = isoTimes.length; i < l; i++) {
              if (isoTimes[i][1].exec(match[3])) {
                  // match[2] should be 'T' or space
                  timeFormat = (match[2] || ' ') + isoTimes[i][0];
                  break;
              }
          }
          if (timeFormat == null) {
              config._isValid = false;
              return;
          }
      }
      if (!allowTime && timeFormat != null) {
          config._isValid = false;
          return;
      }
      if (match[4]) {
          if (tzRegex.exec(match[4])) {
              tzFormat = 'Z';
          } else {
              config._isValid = false;
              return;
          }
      }
      config._f = dateFormat + (timeFormat || '') + (tzFormat || '');
      configFromStringAndFormat(config);
  } else {
      config._isValid = false;
  }
}

//RFC 2822 regex: For details see https://tools.ietf.org/html/rfc2822#section-3.3
var basicRfcRegex = /^((?:Mon|Tue|Wed|Thu|Fri|Sat|Sun),?\s)?(\d?\d\s(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\s(?:\d\d)?\d\d\s)(\d\d:\d\d)(\:\d\d)?(\s(?:UT|GMT|[ECMP][SD]T|[A-IK-Za-ik-z]|[+-]\d{4}))$/;

//date and time from ref 2822 format
function configFromRFC2822(config) {
  var string, match, dayFormat,
      dateFormat, timeFormat, tzFormat;
  var timezones = {
      ' GMT': ' +0000',
      ' EDT': ' -0400',
      ' EST': ' -0500',
      ' CDT': ' -0500',
      ' CST': ' -0600',
      ' MDT': ' -0600',
      ' MST': ' -0700',
      ' PDT': ' -0700',
      ' PST': ' -0800'
  };
  var military = 'YXWVUTSRQPONZABCDEFGHIKLM';
  var timezone, timezoneIndex;

  string = config._i
      .replace(/\([^\)]*\)|[\n\t]/g, ' ') // Remove comments and folding whitespace
      .replace(/(\s\s+)/g, ' ') // Replace multiple-spaces with a single space
      .replace(/^\s|\s$/g, ''); // Remove leading and trailing spaces
  match = basicRfcRegex.exec(string);

  if (match) {
      dayFormat = match[1] ? 'ddd' + ((match[1].length === 5) ? ', ' : ' ') : '';
      dateFormat = 'D MMM ' + ((match[2].length > 10) ? 'YYYY ' : 'YY ');
      timeFormat = 'HH:mm' + (match[4] ? ':ss' : '');

      // TODO: Replace the vanilla JS Date object with an indepentent day-of-week check.
      if (match[1]) { // day of week given
          var momentDate = new Date(match[2]);
          var momentDay = ['Sun','Mon','Tue','Wed','Thu','Fri','Sat'][momentDate.getDay()];

          if (match[1].substr(0,3) !== momentDay) {
              getParsingFlags(config).weekdayMismatch = true;
              config._isValid = false;
              return;
          }
      }

      switch (match[5].length) {
          case 2: // military
              if (timezoneIndex === 0) {
                  timezone = ' +0000';
              } else {
                  timezoneIndex = military.indexOf(match[5][1].toUpperCase()) - 12;
                  timezone = ((timezoneIndex < 0) ? ' -' : ' +') +
                      (('' + timezoneIndex).replace(/^-?/, '0')).match(/..$/)[0] + '00';
              }
              break;
          case 4: // Zone
              timezone = timezones[match[5]];
              break;
          default: // UT or +/-9999
              timezone = timezones[' GMT'];
      }
      match[5] = timezone;
      config._i = match.splice(1).join('');
      tzFormat = ' ZZ';
      config._f = dayFormat + dateFormat + timeFormat + tzFormat;
      configFromStringAndFormat(config);
      getParsingFlags(config).rfc2822 = true;
  } else {
      config._isValid = false;
  }
}

//date from iso format or fallback
function configFromString(config) {
  var matched = aspNetJsonRegex.exec(config._i);

  if (matched !== null) {
      config._d = new Date(+matched[1]);
      return;
  }

  configFromISO(config);
  if (config._isValid === false) {
      delete config._isValid;
  } else {
      return;
  }

  configFromRFC2822(config);
  if (config._isValid === false) {
      delete config._isValid;
  } else {
      return;
  }

  // Final attempt, use Input Fallback
  hooks.createFromInputFallback(config);
}

hooks.createFromInputFallback = deprecate(
  'value provided is not in a recognized RFC2822 or ISO format. moment construction falls back to js Date(), ' +
  'which is not reliable across all browsers and versions. Non RFC2822/ISO date formats are ' +
  'discouraged and will be removed in an upcoming major release. Please refer to ' +
  'http://momentjs.com/guides/#/warnings/js-date/ for more info.',
  function (config) {
      config._d = new Date(config._i + (config._useUTC ? ' UTC' : ''));
  }
);

//Pick the first defined of two or three arguments.
function defaults(a, b, c) {
  if (a != null) {
      return a;
  }
  if (b != null) {
      return b;
  }
  return c;
}

function currentDateArray(config) {
  // hooks is actually the exported moment object
  var nowValue = new Date(hooks.now());
  if (config._useUTC) {
      return [nowValue.getUTCFullYear(), nowValue.getUTCMonth(), nowValue.getUTCDate()];
  }
  return [nowValue.getFullYear(), nowValue.getMonth(), nowValue.getDate()];
}

//convert an array to a date.
//the array should mirror the parameters below
//note: all values past the year are optional and will default to the lowest possible value.
//[year, month, day , hour, minute, second, millisecond]
function configFromArray (config) {
  var i, date, input = [], currentDate, yearToUse;

  if (config._d) {
      return;
  }

  currentDate = currentDateArray(config);

  //compute day of the year from weeks and weekdays
  if (config._w && config._a[DATE] == null && config._a[MONTH] == null) {
      dayOfYearFromWeekInfo(config);
  }

  //if the day of the year is set, figure out what it is
  if (config._dayOfYear != null) {
      yearToUse = defaults(config._a[YEAR], currentDate[YEAR]);

      if (config._dayOfYear > daysInYear(yearToUse) || config._dayOfYear === 0) {
          getParsingFlags(config)._overflowDayOfYear = true;
      }

      date = createUTCDate(yearToUse, 0, config._dayOfYear);
      config._a[MONTH] = date.getUTCMonth();
      config._a[DATE] = date.getUTCDate();
  }

  // Default to current date.
  // * if no year, month, day of month are given, default to today
  // * if day of month is given, default month and year
  // * if month is given, default only year
  // * if year is given, don't default anything
  for (i = 0; i < 3 && config._a[i] == null; ++i) {
      config._a[i] = input[i] = currentDate[i];
  }

  // Zero out whatever was not defaulted, including time
  for (; i < 7; i++) {
      config._a[i] = input[i] = (config._a[i] == null) ? (i === 2 ? 1 : 0) : config._a[i];
  }

  // Check for 24:00:00.000
  if (config._a[HOUR] === 24 &&
          config._a[MINUTE] === 0 &&
          config._a[SECOND] === 0 &&
          config._a[MILLISECOND] === 0) {
      config._nextDay = true;
      config._a[HOUR] = 0;
  }

  config._d = (config._useUTC ? createUTCDate : createDate).apply(null, input);
  // Apply timezone offset from input. The actual utcOffset can be changed
  // with parseZone.
  if (config._tzm != null) {
      config._d.setUTCMinutes(config._d.getUTCMinutes() - config._tzm);
  }

  if (config._nextDay) {
      config._a[HOUR] = 24;
  }
}

function dayOfYearFromWeekInfo(config) {
  var w, weekYear, week, weekday, dow, doy, temp, weekdayOverflow;

  w = config._w;
  if (w.GG != null || w.W != null || w.E != null) {
      dow = 1;
      doy = 4;

      // TODO: We need to take the current isoWeekYear, but that depends on
      // how we interpret now (local, utc, fixed offset). So create
      // a now version of current config (take local/utc/offset flags, and
      // create now).
      weekYear = defaults(w.GG, config._a[YEAR], weekOfYear(createLocal(), 1, 4).year);
      week = defaults(w.W, 1);
      weekday = defaults(w.E, 1);
      if (weekday < 1 || weekday > 7) {
          weekdayOverflow = true;
      }
  } else {
      dow = config._locale._week.dow;
      doy = config._locale._week.doy;

      var curWeek = weekOfYear(createLocal(), dow, doy);

      weekYear = defaults(w.gg, config._a[YEAR], curWeek.year);

      // Default to current week.
      week = defaults(w.w, curWeek.week);

      if (w.d != null) {
          // weekday -- low day numbers are considered next week
          weekday = w.d;
          if (weekday < 0 || weekday > 6) {
              weekdayOverflow = true;
          }
      } else if (w.e != null) {
          // local weekday -- counting starts from begining of week
          weekday = w.e + dow;
          if (w.e < 0 || w.e > 6) {
              weekdayOverflow = true;
          }
      } else {
          // default to begining of week
          weekday = dow;
      }
  }
  if (week < 1 || week > weeksInYear(weekYear, dow, doy)) {
      getParsingFlags(config)._overflowWeeks = true;
  } else if (weekdayOverflow != null) {
      getParsingFlags(config)._overflowWeekday = true;
  } else {
      temp = dayOfYearFromWeeks(weekYear, week, weekday, dow, doy);
      config._a[YEAR] = temp.year;
      config._dayOfYear = temp.dayOfYear;
  }
}

//constant that refers to the ISO standard
hooks.ISO_8601 = function () {};

//constant that refers to the RFC 2822 form
hooks.RFC_2822 = function () {};

//date from string and format string
function configFromStringAndFormat(config) {
  // TODO: Move this to another part of the creation flow to prevent circular deps
  if (config._f === hooks.ISO_8601) {
      configFromISO(config);
      return;
  }
  if (config._f === hooks.RFC_2822) {
      configFromRFC2822(config);
      return;
  }
  config._a = [];
  getParsingFlags(config).empty = true;

  // This array is used to make a Date, either with `new Date` or `Date.UTC`
  var string = '' + config._i,
      i, parsedInput, tokens, token, skipped,
      stringLength = string.length,
      totalParsedInputLength = 0;

  tokens = expandFormat(config._f, config._locale).match(formattingTokens) || [];

  for (i = 0; i < tokens.length; i++) {
      token = tokens[i];
      parsedInput = (string.match(getParseRegexForToken(token, config)) || [])[0];
      // console.log('token', token, 'parsedInput', parsedInput,
      //         'regex', getParseRegexForToken(token, config));
      if (parsedInput) {
          skipped = string.substr(0, string.indexOf(parsedInput));
          if (skipped.length > 0) {
              getParsingFlags(config).unusedInput.push(skipped);
          }
          string = string.slice(string.indexOf(parsedInput) + parsedInput.length);
          totalParsedInputLength += parsedInput.length;
      }
      // don't parse if it's not a known token
      if (formatTokenFunctions[token]) {
          if (parsedInput) {
              getParsingFlags(config).empty = false;
          }
          else {
              getParsingFlags(config).unusedTokens.push(token);
          }
          addTimeToArrayFromToken(token, parsedInput, config);
      }
      else if (config._strict && !parsedInput) {
          getParsingFlags(config).unusedTokens.push(token);
      }
  }

  // add remaining unparsed input length to the string
  getParsingFlags(config).charsLeftOver = stringLength - totalParsedInputLength;
  if (string.length > 0) {
      getParsingFlags(config).unusedInput.push(string);
  }

  // clear _12h flag if hour is <= 12
  if (config._a[HOUR] <= 12 &&
      getParsingFlags(config).bigHour === true &&
      config._a[HOUR] > 0) {
      getParsingFlags(config).bigHour = undefined;
  }

  getParsingFlags(config).parsedDateParts = config._a.slice(0);
  getParsingFlags(config).meridiem = config._meridiem;
  // handle meridiem
  config._a[HOUR] = meridiemFixWrap(config._locale, config._a[HOUR], config._meridiem);

  configFromArray(config);
  checkOverflow(config);
}


function meridiemFixWrap (locale, hour, meridiem) {
  var isPm;

  if (meridiem == null) {
      // nothing to do
      return hour;
  }
  if (locale.meridiemHour != null) {
      return locale.meridiemHour(hour, meridiem);
  } else if (locale.isPM != null) {
      // Fallback
      isPm = locale.isPM(meridiem);
      if (isPm && hour < 12) {
          hour += 12;
      }
      if (!isPm && hour === 12) {
          hour = 0;
      }
      return hour;
  } else {
      // this is not supposed to happen
      return hour;
  }
}

//date from string and array of format strings
function configFromStringAndArray(config) {
  var tempConfig,
      bestMoment,

      scoreToBeat,
      i,
      currentScore;

  if (config._f.length === 0) {
      getParsingFlags(config).invalidFormat = true;
      config._d = new Date(NaN);
      return;
  }

  for (i = 0; i < config._f.length; i++) {
      currentScore = 0;
      tempConfig = copyConfig({}, config);
      if (config._useUTC != null) {
          tempConfig._useUTC = config._useUTC;
      }
      tempConfig._f = config._f[i];
      configFromStringAndFormat(tempConfig);

      if (!isValid(tempConfig)) {
          continue;
      }

      // if there is any input that was not parsed add a penalty for that format
      currentScore += getParsingFlags(tempConfig).charsLeftOver;

      //or tokens
      currentScore += getParsingFlags(tempConfig).unusedTokens.length * 10;

      getParsingFlags(tempConfig).score = currentScore;

      if (scoreToBeat == null || currentScore < scoreToBeat) {
          scoreToBeat = currentScore;
          bestMoment = tempConfig;
      }
  }

  extend(config, bestMoment || tempConfig);
}

function configFromObject(config) {
  if (config._d) {
      return;
  }

  var i = normalizeObjectUnits(config._i);
  config._a = map([i.year, i.month, i.day || i.date, i.hour, i.minute, i.second, i.millisecond], function (obj) {
      return obj && parseInt(obj, 10);
  });

  configFromArray(config);
}

function createFromConfig (config) {
  var res = new Moment(checkOverflow(prepareConfig(config)));
  if (res._nextDay) {
      // Adding is smart enough around DST
      res.add(1, 'd');
      res._nextDay = undefined;
  }

  return res;
}

function prepareConfig (config) {
  var input = config._i,
      format = config._f;

  config._locale = config._locale || getLocale(config._l);

  if (input === null || (format === undefined && input === '')) {
      return createInvalid({nullInput: true});
  }

  if (typeof input === 'string') {
      config._i = input = config._locale.preparse(input);
  }

  if (isMoment(input)) {
      return new Moment(checkOverflow(input));
  } else if (isDate(input)) {
      config._d = input;
  } else if (isArray(format)) {
      configFromStringAndArray(config);
  } else if (format) {
      configFromStringAndFormat(config);
  }  else {
      configFromInput(config);
  }

  if (!isValid(config)) {
      config._d = null;
  }

  return config;
}

function configFromInput(config) {
  var input = config._i;
  if (isUndefined(input)) {
      config._d = new Date(hooks.now());
  } else if (isDate(input)) {
      config._d = new Date(input.valueOf());
  } else if (typeof input === 'string') {
      configFromString(config);
  } else if (isArray(input)) {
      config._a = map(input.slice(0), function (obj) {
          return parseInt(obj, 10);
      });
      configFromArray(config);
  } else if (isObject(input)) {
      configFromObject(config);
  } else if (isNumber(input)) {
      // from milliseconds
      config._d = new Date(input);
  } else {
      hooks.createFromInputFallback(config);
  }
}

function createLocalOrUTC (input, format, locale, strict, isUTC) {
  var c = {};

  if (locale === true || locale === false) {
      strict = locale;
      locale = undefined;
  }

  if ((isObject(input) && isObjectEmpty(input)) ||
          (isArray(input) && input.length === 0)) {
      input = undefined;
  }
  // object construction must be done this way.
  // https://github.com/moment/moment/issues/1423
  c._isAMomentObject = true;
  c._useUTC = c._isUTC = isUTC;
  c._l = locale;
  c._i = input;
  c._f = format;
  c._strict = strict;

  return createFromConfig(c);
}

function createLocal (input, format, locale, strict) {
  return createLocalOrUTC(input, format, locale, strict, false);
}

var prototypeMin = deprecate(
  'moment().min is deprecated, use moment.max instead. http://momentjs.com/guides/#/warnings/min-max/',
  function () {
      var other = createLocal.apply(null, arguments);
      if (this.isValid() && other.isValid()) {
          return other < this ? this : other;
      } else {
          return createInvalid();
      }
  }
);

var prototypeMax = deprecate(
  'moment().max is deprecated, use moment.min instead. http://momentjs.com/guides/#/warnings/min-max/',
  function () {
      var other = createLocal.apply(null, arguments);
      if (this.isValid() && other.isValid()) {
          return other > this ? this : other;
      } else {
          return createInvalid();
      }
  }
);

//Pick a moment m from moments so that m[fn](other) is true for all
//other. This relies on the function fn to be transitive.
//
//moments should either be an array of moment objects or an array, whose
//first element is an array of moment objects.
function pickBy(fn, moments) {
  var res, i;
  if (moments.length === 1 && isArray(moments[0])) {
      moments = moments[0];
  }
  if (!moments.length) {
      return createLocal();
  }
  res = moments[0];
  for (i = 1; i < moments.length; ++i) {
      if (!moments[i].isValid() || moments[i][fn](res)) {
          res = moments[i];
      }
  }
  return res;
}

//TODO: Use [].sort instead?
function min () {
  var args = [].slice.call(arguments, 0);

  return pickBy('isBefore', args);
}

function max () {
  var args = [].slice.call(arguments, 0);

  return pickBy('isAfter', args);
}

var now = function () {
  return Date.now ? Date.now() : +(new Date());
};

var ordering = ['year', 'quarter', 'month', 'week', 'day', 'hour', 'minute', 'second', 'millisecond'];

function isDurationValid(m) {
  for (var key in m) {
      if (!(ordering.indexOf(key) !== -1 && (m[key] == null || !isNaN(m[key])))) {
          return false;
      }
  }

  var unitHasDecimal = false;
  for (var i = 0; i < ordering.length; ++i) {
      if (m[ordering[i]]) {
          if (unitHasDecimal) {
              return false; // only allow non-integers for smallest unit
          }
          if (parseFloat(m[ordering[i]]) !== toInt(m[ordering[i]])) {
              unitHasDecimal = true;
          }
      }
  }

  return true;
}

function isValid$1() {
  return this._isValid;
}

function createInvalid$1() {
  return createDuration(NaN);
}

function Duration (duration) {
  var normalizedInput = normalizeObjectUnits(duration),
      years = normalizedInput.year || 0,
      quarters = normalizedInput.quarter || 0,
      months = normalizedInput.month || 0,
      weeks = normalizedInput.week || 0,
      days = normalizedInput.day || 0,
      hours = normalizedInput.hour || 0,
      minutes = normalizedInput.minute || 0,
      seconds = normalizedInput.second || 0,
      milliseconds = normalizedInput.millisecond || 0;

  this._isValid = isDurationValid(normalizedInput);

  // representation for dateAddRemove
  this._milliseconds = +milliseconds +
      seconds * 1e3 + // 1000
      minutes * 6e4 + // 1000 * 60
      hours * 1000 * 60 * 60; //using 1000 * 60 * 60 instead of 36e5 to avoid floating point rounding errors https://github.com/moment/moment/issues/2978
  // Because of dateAddRemove treats 24 hours as different from a
  // day when working around DST, we need to store them separately
  this._days = +days +
      weeks * 7;
  // It is impossible translate months into days without knowing
  // which months you are are talking about, so we have to store
  // it separately.
  this._months = +months +
      quarters * 3 +
      years * 12;

  this._data = {};

  this._locale = getLocale();

  this._bubble();
}

function isDuration (obj) {
  return obj instanceof Duration;
}

function absRound (number) {
  if (number < 0) {
      return Math.round(-1 * number) * -1;
  } else {
      return Math.round(number);
  }
}

//FORMATTING

function offset (token, separator) {
  addFormatToken(token, 0, 0, function () {
      var offset = this.utcOffset();
      var sign = '+';
      if (offset < 0) {
          offset = -offset;
          sign = '-';
      }
      return sign + zeroFill(~~(offset / 60), 2) + separator + zeroFill(~~(offset) % 60, 2);
  });
}

offset('Z', ':');
offset('ZZ', '');

//PARSING

addRegexToken('Z',  matchShortOffset);
addRegexToken('ZZ', matchShortOffset);
addParseToken(['Z', 'ZZ'], function (input, array, config) {
  config._useUTC = true;
  config._tzm = offsetFromString(matchShortOffset, input);
});

//HELPERS

//timezone chunker
//'+10:00' > ['10',  '00']
//'-1530'  > ['-15', '30']
var chunkOffset = /([\+\-]|\d\d)/gi;

function offsetFromString(matcher, string) {
  var matches = (string || '').match(matcher);

  if (matches === null) {
      return null;
  }

  var chunk   = matches[matches.length - 1] || [];
  var parts   = (chunk + '').match(chunkOffset) || ['-', 0, 0];
  var minutes = +(parts[1] * 60) + toInt(parts[2]);

  return minutes === 0 ?
    0 :
    parts[0] === '+' ? minutes : -minutes;
}

//Return a moment from input, that is local/utc/zone equivalent to model.
function cloneWithOffset(input, model) {
  var res, diff;
  if (model._isUTC) {
      res = model.clone();
      diff = (isMoment(input) || isDate(input) ? input.valueOf() : createLocal(input).valueOf()) - res.valueOf();
      // Use low-level api, because this fn is low-level api.
      res._d.setTime(res._d.valueOf() + diff);
      hooks.updateOffset(res, false);
      return res;
  } else {
      return createLocal(input).local();
  }
}

function getDateOffset (m) {
  // On Firefox.24 Date#getTimezoneOffset returns a floating point.
  // https://github.com/moment/moment/pull/1871
  return -Math.round(m._d.getTimezoneOffset() / 15) * 15;
}

//HOOKS

//This function will be called whenever a moment is mutated.
//It is intended to keep the offset in sync with the timezone.
hooks.updateOffset = function () {};

//MOMENTS

//keepLocalTime = true means only change the timezone, without
//affecting the local hour. So 5:31:26 +0300 --[utcOffset(2, true)]-->
//5:31:26 +0200 It is possible that 5:31:26 doesn't exist with offset
//+0200, so we adjust the time as needed, to be valid.
//
//Keeping the time actually adds/subtracts (one hour)
//from the actual represented time. That is why we call updateOffset
//a second time. In case it wants us to change the offset again
//_changeInProgress == true case, then we have to adjust, because
//there is no such time in the given timezone.
function getSetOffset (input, keepLocalTime, keepMinutes) {
  var offset = this._offset || 0,
      localAdjust;
  if (!this.isValid()) {
      return input != null ? this : NaN;
  }
  if (input != null) {
      if (typeof input === 'string') {
          input = offsetFromString(matchShortOffset, input);
          if (input === null) {
              return this;
          }
      } else if (Math.abs(input) < 16 && !keepMinutes) {
          input = input * 60;
      }
      if (!this._isUTC && keepLocalTime) {
          localAdjust = getDateOffset(this);
      }
      this._offset = input;
      this._isUTC = true;
      if (localAdjust != null) {
          this.add(localAdjust, 'm');
      }
      if (offset !== input) {
          if (!keepLocalTime || this._changeInProgress) {
              addSubtract(this, createDuration(input - offset, 'm'), 1, false);
          } else if (!this._changeInProgress) {
              this._changeInProgress = true;
              hooks.updateOffset(this, true);
              this._changeInProgress = null;
          }
      }
      return this;
  } else {
      return this._isUTC ? offset : getDateOffset(this);
  }
}

function getSetZone (input, keepLocalTime) {
  if (input != null) {
      if (typeof input !== 'string') {
          input = -input;
      }

      this.utcOffset(input, keepLocalTime);

      return this;
  } else {
      return -this.utcOffset();
  }
}

function setOffsetToUTC (keepLocalTime) {
  return this.utcOffset(0, keepLocalTime);
}

function setOffsetToLocal (keepLocalTime) {
  if (this._isUTC) {
      this.utcOffset(0, keepLocalTime);
      this._isUTC = false;

      if (keepLocalTime) {
          this.subtract(getDateOffset(this), 'm');
      }
  }
  return this;
}

function setOffsetToParsedOffset () {
  if (this._tzm != null) {
      this.utcOffset(this._tzm, false, true);
  } else if (typeof this._i === 'string') {
      var tZone = offsetFromString(matchOffset, this._i);
      if (tZone != null) {
          this.utcOffset(tZone);
      }
      else {
          this.utcOffset(0, true);
      }
  }
  return this;
}

function hasAlignedHourOffset (input) {
  if (!this.isValid()) {
      return false;
  }
  input = input ? createLocal(input).utcOffset() : 0;

  return (this.utcOffset() - input) % 60 === 0;
}

function isDaylightSavingTime () {
  return (
      this.utcOffset() > this.clone().month(0).utcOffset() ||
      this.utcOffset() > this.clone().month(5).utcOffset()
  );
}

function isDaylightSavingTimeShifted () {
  if (!isUndefined(this._isDSTShifted)) {
      return this._isDSTShifted;
  }

  var c = {};

  copyConfig(c, this);
  c = prepareConfig(c);

  if (c._a) {
      var other = c._isUTC ? createUTC(c._a) : createLocal(c._a);
      this._isDSTShifted = this.isValid() &&
          compareArrays(c._a, other.toArray()) > 0;
  } else {
      this._isDSTShifted = false;
  }

  return this._isDSTShifted;
}

function isLocal () {
  return this.isValid() ? !this._isUTC : false;
}

function isUtcOffset () {
  return this.isValid() ? this._isUTC : false;
}

function isUtc () {
  return this.isValid() ? this._isUTC && this._offset === 0 : false;
}

//ASP.NET json date format regex
var aspNetRegex = /^(\-)?(?:(\d*)[. ])?(\d+)\:(\d+)(?:\:(\d+)(\.\d*)?)?$/;

//from http://docs.closure-library.googlecode.com/git/closure_goog_date_date.js.source.html
//somewhat more in line with 4.4.3.2 2004 spec, but allows decimal anywhere
//and further modified to allow for strings containing both week and day
var isoRegex = /^(-)?P(?:(-?[0-9,.]*)Y)?(?:(-?[0-9,.]*)M)?(?:(-?[0-9,.]*)W)?(?:(-?[0-9,.]*)D)?(?:T(?:(-?[0-9,.]*)H)?(?:(-?[0-9,.]*)M)?(?:(-?[0-9,.]*)S)?)?$/;

function createDuration (input, key) {
  var duration = input,
      // matching against regexp is expensive, do it on demand
      match = null,
      sign,
      ret,
      diffRes;

  if (isDuration(input)) {
      duration = {
          ms : input._milliseconds,
          d  : input._days,
          M  : input._months
      };
  } else if (isNumber(input)) {
      duration = {};
      if (key) {
          duration[key] = input;
      } else {
          duration.milliseconds = input;
      }
  } else if (!!(match = aspNetRegex.exec(input))) {
      sign = (match[1] === '-') ? -1 : 1;
      duration = {
          y  : 0,
          d  : toInt(match[DATE])                         * sign,
          h  : toInt(match[HOUR])                         * sign,
          m  : toInt(match[MINUTE])                       * sign,
          s  : toInt(match[SECOND])                       * sign,
          ms : toInt(absRound(match[MILLISECOND] * 1000)) * sign // the millisecond decimal point is included in the match
      };
  } else if (!!(match = isoRegex.exec(input))) {
      sign = (match[1] === '-') ? -1 : 1;
      duration = {
          y : parseIso(match[2], sign),
          M : parseIso(match[3], sign),
          w : parseIso(match[4], sign),
          d : parseIso(match[5], sign),
          h : parseIso(match[6], sign),
          m : parseIso(match[7], sign),
          s : parseIso(match[8], sign)
      };
  } else if (duration == null) {// checks for null or undefined
      duration = {};
  } else if (typeof duration === 'object' && ('from' in duration || 'to' in duration)) {
      diffRes = momentsDifference(createLocal(duration.from), createLocal(duration.to));

      duration = {};
      duration.ms = diffRes.milliseconds;
      duration.M = diffRes.months;
  }

  ret = new Duration(duration);

  if (isDuration(input) && hasOwnProp(input, '_locale')) {
      ret._locale = input._locale;
  }

  return ret;
}

createDuration.fn = Duration.prototype;
createDuration.invalid = createInvalid$1;

function parseIso (inp, sign) {
  // We'd normally use ~~inp for this, but unfortunately it also
  // converts floats to ints.
  // inp may be undefined, so careful calling replace on it.
  var res = inp && parseFloat(inp.replace(',', '.'));
  // apply sign while we're at it
  return (isNaN(res) ? 0 : res) * sign;
}

function positiveMomentsDifference(base, other) {
  var res = {milliseconds: 0, months: 0};

  res.months = other.month() - base.month() +
      (other.year() - base.year()) * 12;
  if (base.clone().add(res.months, 'M').isAfter(other)) {
      --res.months;
  }

  res.milliseconds = +other - +(base.clone().add(res.months, 'M'));

  return res;
}

function momentsDifference(base, other) {
  var res;
  if (!(base.isValid() && other.isValid())) {
      return {milliseconds: 0, months: 0};
  }

  other = cloneWithOffset(other, base);
  if (base.isBefore(other)) {
      res = positiveMomentsDifference(base, other);
  } else {
      res = positiveMomentsDifference(other, base);
      res.milliseconds = -res.milliseconds;
      res.months = -res.months;
  }

  return res;
}

//TODO: remove 'name' arg after deprecation is removed
function createAdder(direction, name) {
  return function (val, period) {
      var dur, tmp;
      //invert the arguments, but complain about it
      if (period !== null && !isNaN(+period)) {
          deprecateSimple(name, 'moment().' + name  + '(period, number) is deprecated. Please use moment().' + name + '(number, period). ' +
          'See http://momentjs.com/guides/#/warnings/add-inverted-param/ for more info.');
          tmp = val; val = period; period = tmp;
      }

      val = typeof val === 'string' ? +val : val;
      dur = createDuration(val, period);
      addSubtract(this, dur, direction);
      return this;
  };
}

function addSubtract (mom, duration, isAdding, updateOffset) {
  var milliseconds = duration._milliseconds,
      days = absRound(duration._days),
      months = absRound(duration._months);

  if (!mom.isValid()) {
      // No op
      return;
  }

  updateOffset = updateOffset == null ? true : updateOffset;

  if (milliseconds) {
      mom._d.setTime(mom._d.valueOf() + milliseconds * isAdding);
  }
  if (days) {
      set$1(mom, 'Date', get(mom, 'Date') + days * isAdding);
  }
  if (months) {
      setMonth(mom, get(mom, 'Month') + months * isAdding);
  }
  if (updateOffset) {
      hooks.updateOffset(mom, days || months);
  }
}

var add      = createAdder(1, 'add');
var subtract = createAdder(-1, 'subtract');

function getCalendarFormat(myMoment, now) {
  var diff = myMoment.diff(now, 'days', true);
  return diff < -6 ? 'sameElse' :
          diff < -1 ? 'lastWeek' :
          diff < 0 ? 'lastDay' :
          diff < 1 ? 'sameDay' :
          diff < 2 ? 'nextDay' :
          diff < 7 ? 'nextWeek' : 'sameElse';
}

function calendar$1 (time, formats) {
  // We want to compare the start of today, vs this.
  // Getting start-of-today depends on whether we're local/utc/offset or not.
  var now = time || createLocal(),
      sod = cloneWithOffset(now, this).startOf('day'),
      format = hooks.calendarFormat(this, sod) || 'sameElse';

  var output = formats && (isFunction(formats[format]) ? formats[format].call(this, now) : formats[format]);

  return this.format(output || this.localeData().calendar(format, this, createLocal(now)));
}

function clone () {
  return new Moment(this);
}

function isAfter (input, units) {
  var localInput = isMoment(input) ? input : createLocal(input);
  if (!(this.isValid() && localInput.isValid())) {
      return false;
  }
  units = normalizeUnits(!isUndefined(units) ? units : 'millisecond');
  if (units === 'millisecond') {
      return this.valueOf() > localInput.valueOf();
  } else {
      return localInput.valueOf() < this.clone().startOf(units).valueOf();
  }
}

function isBefore (input, units) {
  var localInput = isMoment(input) ? input : createLocal(input);
  if (!(this.isValid() && localInput.isValid())) {
      return false;
  }
  units = normalizeUnits(!isUndefined(units) ? units : 'millisecond');
  if (units === 'millisecond') {
      return this.valueOf() < localInput.valueOf();
  } else {
      return this.clone().endOf(units).valueOf() < localInput.valueOf();
  }
}

function isBetween (from, to, units, inclusivity) {
  inclusivity = inclusivity || '()';
  return (inclusivity[0] === '(' ? this.isAfter(from, units) : !this.isBefore(from, units)) &&
      (inclusivity[1] === ')' ? this.isBefore(to, units) : !this.isAfter(to, units));
}

function isSame (input, units) {
  var localInput = isMoment(input) ? input : createLocal(input),
      inputMs;
  if (!(this.isValid() && localInput.isValid())) {
      return false;
  }
  units = normalizeUnits(units || 'millisecond');
  if (units === 'millisecond') {
      return this.valueOf() === localInput.valueOf();
  } else {
      inputMs = localInput.valueOf();
      return this.clone().startOf(units).valueOf() <= inputMs && inputMs <= this.clone().endOf(units).valueOf();
  }
}

function isSameOrAfter (input, units) {
  return this.isSame(input, units) || this.isAfter(input,units);
}

function isSameOrBefore (input, units) {
  return this.isSame(input, units) || this.isBefore(input,units);
}

function diff (input, units, asFloat) {
  var that,
      zoneDelta,
      delta, output;

  if (!this.isValid()) {
      return NaN;
  }

  that = cloneWithOffset(input, this);

  if (!that.isValid()) {
      return NaN;
  }

  zoneDelta = (that.utcOffset() - this.utcOffset()) * 6e4;

  units = normalizeUnits(units);

  if (units === 'year' || units === 'month' || units === 'quarter') {
      output = monthDiff(this, that);
      if (units === 'quarter') {
          output = output / 3;
      } else if (units === 'year') {
          output = output / 12;
      }
  } else {
      delta = this - that;
      output = units === 'second' ? delta / 1e3 : // 1000
          units === 'minute' ? delta / 6e4 : // 1000 * 60
          units === 'hour' ? delta / 36e5 : // 1000 * 60 * 60
          units === 'day' ? (delta - zoneDelta) / 864e5 : // 1000 * 60 * 60 * 24, negate dst
          units === 'week' ? (delta - zoneDelta) / 6048e5 : // 1000 * 60 * 60 * 24 * 7, negate dst
          delta;
  }
  return asFloat ? output : absFloor(output);
}

function monthDiff (a, b) {
  // difference in months
  var wholeMonthDiff = ((b.year() - a.year()) * 12) + (b.month() - a.month()),
      // b is in (anchor - 1 month, anchor + 1 month)
      anchor = a.clone().add(wholeMonthDiff, 'months'),
      anchor2, adjust;

  if (b - anchor < 0) {
      anchor2 = a.clone().add(wholeMonthDiff - 1, 'months');
      // linear across the month
      adjust = (b - anchor) / (anchor - anchor2);
  } else {
      anchor2 = a.clone().add(wholeMonthDiff + 1, 'months');
      // linear across the month
      adjust = (b - anchor) / (anchor2 - anchor);
  }

  //check for negative zero, return zero if negative zero
  return -(wholeMonthDiff + adjust) || 0;
}

hooks.defaultFormat = 'YYYY-MM-DDTHH:mm:ssZ';
hooks.defaultFormatUtc = 'YYYY-MM-DDTHH:mm:ss[Z]';

function toString () {
  return this.clone().locale('en').format('ddd MMM DD YYYY HH:mm:ss [GMT]ZZ');
}

function toISOString() {
  if (!this.isValid()) {
      return null;
  }
  var m = this.clone().utc();
  if (m.year() < 0 || m.year() > 9999) {
      return formatMoment(m, 'YYYYYY-MM-DD[T]HH:mm:ss.SSS[Z]');
  }
  if (isFunction(Date.prototype.toISOString)) {
      // native implementation is ~50x faster, use it when we can
      return this.toDate().toISOString();
  }
  return formatMoment(m, 'YYYY-MM-DD[T]HH:mm:ss.SSS[Z]');
}

function inspect () {
  if (!this.isValid()) {
      return 'moment.invalid(/* ' + this._i + ' */)';
  }
  var func = 'moment';
  var zone = '';
  if (!this.isLocal()) {
      func = this.utcOffset() === 0 ? 'moment.utc' : 'moment.parseZone';
      zone = 'Z';
  }
  var prefix = '[' + func + '("]';
  var year = (0 <= this.year() && this.year() <= 9999) ? 'YYYY' : 'YYYYYY';
  var datetime = '-MM-DD[T]HH:mm:ss.SSS';
  var suffix = zone + '[")]';

  return this.format(prefix + year + datetime + suffix);
}

function format (inputString) {
  if (!inputString) {
      inputString = this.isUtc() ? hooks.defaultFormatUtc : hooks.defaultFormat;
  }
  var output = formatMoment(this, inputString);
  return this.localeData().postformat(output);
}

function from (time, withoutSuffix) {
  if (this.isValid() &&
          ((isMoment(time) && time.isValid()) ||
           createLocal(time).isValid())) {
      return createDuration({to: this, from: time}).locale(this.locale()).humanize(!withoutSuffix);
  } else {
      return this.localeData().invalidDate();
  }
}

function fromNow (withoutSuffix) {
  return this.from(createLocal(), withoutSuffix);
}

function to (time, withoutSuffix) {
  if (this.isValid() &&
          ((isMoment(time) && time.isValid()) ||
           createLocal(time).isValid())) {
      return createDuration({from: this, to: time}).locale(this.locale()).humanize(!withoutSuffix);
  } else {
      return this.localeData().invalidDate();
  }
}

function toNow (withoutSuffix) {
  return this.to(createLocal(), withoutSuffix);
}

//If passed a locale key, it will set the locale for this
//instance.  Otherwise, it will return the locale configuration
//variables for this instance.
function locale (key) {
  var newLocaleData;

  if (key === undefined) {
      return this._locale._abbr;
  } else {
      newLocaleData = getLocale(key);
      if (newLocaleData != null) {
          this._locale = newLocaleData;
      }
      return this;
  }
}

var lang = deprecate(
  'moment().lang() is deprecated. Instead, use moment().localeData() to get the language configuration. Use moment().locale() to change languages.',
  function (key) {
      if (key === undefined) {
          return this.localeData();
      } else {
          return this.locale(key);
      }
  }
);

function localeData () {
  return this._locale;
}

function startOf (units) {
  units = normalizeUnits(units);
  // the following switch intentionally omits break keywords
  // to utilize falling through the cases.
  switch (units) {
      case 'year':
          this.month(0);
          /* falls through */
      case 'quarter':
      case 'month':
          this.date(1);
          /* falls through */
      case 'week':
      case 'isoWeek':
      case 'day':
      case 'date':
          this.hours(0);
          /* falls through */
      case 'hour':
          this.minutes(0);
          /* falls through */
      case 'minute':
          this.seconds(0);
          /* falls through */
      case 'second':
          this.milliseconds(0);
  }

  // weeks are a special case
  if (units === 'week') {
      this.weekday(0);
  }
  if (units === 'isoWeek') {
      this.isoWeekday(1);
  }

  // quarters are also special
  if (units === 'quarter') {
      this.month(Math.floor(this.month() / 3) * 3);
  }

  return this;
}

function endOf (units) {
  units = normalizeUnits(units);
  if (units === undefined || units === 'millisecond') {
      return this;
  }

  // 'date' is an alias for 'day', so it should be considered as such.
  if (units === 'date') {
      units = 'day';
  }

  return this.startOf(units).add(1, (units === 'isoWeek' ? 'week' : units)).subtract(1, 'ms');
}

function valueOf () {
  return this._d.valueOf() - ((this._offset || 0) * 60000);
}

function unix () {
  return Math.floor(this.valueOf() / 1000);
}

function toDate () {
  return new Date(this.valueOf());
}

function toArray () {
  var m = this;
  return [m.year(), m.month(), m.date(), m.hour(), m.minute(), m.second(), m.millisecond()];
}

function toObject () {
  var m = this;
  return {
      years: m.year(),
      months: m.month(),
      date: m.date(),
      hours: m.hours(),
      minutes: m.minutes(),
      seconds: m.seconds(),
      milliseconds: m.milliseconds()
  };
}

function toJSON () {
  // new Date(NaN).toJSON() === null
  return this.isValid() ? this.toISOString() : null;
}

function isValid$2 () {
  return isValid(this);
}

function parsingFlags () {
  return extend({}, getParsingFlags(this));
}

function invalidAt () {
  return getParsingFlags(this).overflow;
}

function creationData() {
  return {
      input: this._i,
      format: this._f,
      locale: this._locale,
      isUTC: this._isUTC,
      strict: this._strict
  };
}

//FORMATTING

addFormatToken(0, ['gg', 2], 0, function () {
  return this.weekYear() % 100;
});

addFormatToken(0, ['GG', 2], 0, function () {
  return this.isoWeekYear() % 100;
});

function addWeekYearFormatToken (token, getter) {
  addFormatToken(0, [token, token.length], 0, getter);
}

addWeekYearFormatToken('gggg',     'weekYear');
addWeekYearFormatToken('ggggg',    'weekYear');
addWeekYearFormatToken('GGGG',  'isoWeekYear');
addWeekYearFormatToken('GGGGG', 'isoWeekYear');

//ALIASES

addUnitAlias('weekYear', 'gg');
addUnitAlias('isoWeekYear', 'GG');

//PRIORITY

addUnitPriority('weekYear', 1);
addUnitPriority('isoWeekYear', 1);


//PARSING

addRegexToken('G',      matchSigned);
addRegexToken('g',      matchSigned);
addRegexToken('GG',     match1to2, match2);
addRegexToken('gg',     match1to2, match2);
addRegexToken('GGGG',   match1to4, match4);
addRegexToken('gggg',   match1to4, match4);
addRegexToken('GGGGG',  match1to6, match6);
addRegexToken('ggggg',  match1to6, match6);

addWeekParseToken(['gggg', 'ggggg', 'GGGG', 'GGGGG'], function (input, week, config, token) {
  week[token.substr(0, 2)] = toInt(input);
});

addWeekParseToken(['gg', 'GG'], function (input, week, config, token) {
  week[token] = hooks.parseTwoDigitYear(input);
});

//MOMENTS

function getSetWeekYear (input) {
  return getSetWeekYearHelper.call(this,
          input,
          this.week(),
          this.weekday(),
          this.localeData()._week.dow,
          this.localeData()._week.doy);
}

function getSetISOWeekYear (input) {
  return getSetWeekYearHelper.call(this,
          input, this.isoWeek(), this.isoWeekday(), 1, 4);
}

function getISOWeeksInYear () {
  return weeksInYear(this.year(), 1, 4);
}

function getWeeksInYear () {
  var weekInfo = this.localeData()._week;
  return weeksInYear(this.year(), weekInfo.dow, weekInfo.doy);
}

function getSetWeekYearHelper(input, week, weekday, dow, doy) {
  var weeksTarget;
  if (input == null) {
      return weekOfYear(this, dow, doy).year;
  } else {
      weeksTarget = weeksInYear(input, dow, doy);
      if (week > weeksTarget) {
          week = weeksTarget;
      }
      return setWeekAll.call(this, input, week, weekday, dow, doy);
  }
}

function setWeekAll(weekYear, week, weekday, dow, doy) {
  var dayOfYearData = dayOfYearFromWeeks(weekYear, week, weekday, dow, doy),
      date = createUTCDate(dayOfYearData.year, 0, dayOfYearData.dayOfYear);

  this.year(date.getUTCFullYear());
  this.month(date.getUTCMonth());
  this.date(date.getUTCDate());
  return this;
}

//FORMATTING

addFormatToken('Q', 0, 'Qo', 'quarter');

//ALIASES

addUnitAlias('quarter', 'Q');

//PRIORITY

addUnitPriority('quarter', 7);

//PARSING

addRegexToken('Q', match1);
addParseToken('Q', function (input, array) {
  array[MONTH] = (toInt(input) - 1) * 3;
});

//MOMENTS

function getSetQuarter (input) {
  return input == null ? Math.ceil((this.month() + 1) / 3) : this.month((input - 1) * 3 + this.month() % 3);
}

//FORMATTING

addFormatToken('D', ['DD', 2], 'Do', 'date');

//ALIASES

addUnitAlias('date', 'D');

//PRIOROITY
addUnitPriority('date', 9);

//PARSING

addRegexToken('D',  match1to2);
addRegexToken('DD', match1to2, match2);
addRegexToken('Do', function (isStrict, locale) {
  // TODO: Remove "ordinalParse" fallback in next major release.
  return isStrict ?
    (locale._dayOfMonthOrdinalParse || locale._ordinalParse) :
    locale._dayOfMonthOrdinalParseLenient;
});

addParseToken(['D', 'DD'], DATE);
addParseToken('Do', function (input, array) {
  array[DATE] = toInt(input.match(match1to2)[0], 10);
});

//MOMENTS

var getSetDayOfMonth = makeGetSet('Date', true);

//FORMATTING

addFormatToken('DDD', ['DDDD', 3], 'DDDo', 'dayOfYear');

//ALIASES

addUnitAlias('dayOfYear', 'DDD');

//PRIORITY
addUnitPriority('dayOfYear', 4);

//PARSING

addRegexToken('DDD',  match1to3);
addRegexToken('DDDD', match3);
addParseToken(['DDD', 'DDDD'], function (input, array, config) {
  config._dayOfYear = toInt(input);
});

//HELPERS

//MOMENTS

function getSetDayOfYear (input) {
  var dayOfYear = Math.round((this.clone().startOf('day') - this.clone().startOf('year')) / 864e5) + 1;
  return input == null ? dayOfYear : this.add((input - dayOfYear), 'd');
}

//FORMATTING

addFormatToken('m', ['mm', 2], 0, 'minute');

//ALIASES

addUnitAlias('minute', 'm');

//PRIORITY

addUnitPriority('minute', 14);

//PARSING

addRegexToken('m',  match1to2);
addRegexToken('mm', match1to2, match2);
addParseToken(['m', 'mm'], MINUTE);

//MOMENTS

var getSetMinute = makeGetSet('Minutes', false);

//FORMATTING

addFormatToken('s', ['ss', 2], 0, 'second');

//ALIASES

addUnitAlias('second', 's');

//PRIORITY

addUnitPriority('second', 15);

//PARSING

addRegexToken('s',  match1to2);
addRegexToken('ss', match1to2, match2);
addParseToken(['s', 'ss'], SECOND);

//MOMENTS

var getSetSecond = makeGetSet('Seconds', false);

//FORMATTING

addFormatToken('S', 0, 0, function () {
  return ~~(this.millisecond() / 100);
});

addFormatToken(0, ['SS', 2], 0, function () {
  return ~~(this.millisecond() / 10);
});

addFormatToken(0, ['SSS', 3], 0, 'millisecond');
addFormatToken(0, ['SSSS', 4], 0, function () {
  return this.millisecond() * 10;
});
addFormatToken(0, ['SSSSS', 5], 0, function () {
  return this.millisecond() * 100;
});
addFormatToken(0, ['SSSSSS', 6], 0, function () {
  return this.millisecond() * 1000;
});
addFormatToken(0, ['SSSSSSS', 7], 0, function () {
  return this.millisecond() * 10000;
});
addFormatToken(0, ['SSSSSSSS', 8], 0, function () {
  return this.millisecond() * 100000;
});
addFormatToken(0, ['SSSSSSSSS', 9], 0, function () {
  return this.millisecond() * 1000000;
});


//ALIASES

addUnitAlias('millisecond', 'ms');

//PRIORITY

addUnitPriority('millisecond', 16);

//PARSING

addRegexToken('S',    match1to3, match1);
addRegexToken('SS',   match1to3, match2);
addRegexToken('SSS',  match1to3, match3);

var token;
for (token = 'SSSS'; token.length <= 9; token += 'S') {
  addRegexToken(token, matchUnsigned);
}

function parseMs(input, array) {
  array[MILLISECOND] = toInt(('0.' + input) * 1000);
}

for (token = 'S'; token.length <= 9; token += 'S') {
  addParseToken(token, parseMs);
}
//MOMENTS

var getSetMillisecond = makeGetSet('Milliseconds', false);

//FORMATTING

addFormatToken('z',  0, 0, 'zoneAbbr');
addFormatToken('zz', 0, 0, 'zoneName');

//MOMENTS

function getZoneAbbr () {
  return this._isUTC ? 'UTC' : '';
}

function getZoneName () {
  return this._isUTC ? 'Coordinated Universal Time' : '';
}

var proto = Moment.prototype;

proto.add               = add;
proto.calendar          = calendar$1;
proto.clone             = clone;
proto.diff              = diff;
proto.endOf             = endOf;
proto.format            = format;
proto.from              = from;
proto.fromNow           = fromNow;
proto.to                = to;
proto.toNow             = toNow;
proto.get               = stringGet;
proto.invalidAt         = invalidAt;
proto.isAfter           = isAfter;
proto.isBefore          = isBefore;
proto.isBetween         = isBetween;
proto.isSame            = isSame;
proto.isSameOrAfter     = isSameOrAfter;
proto.isSameOrBefore    = isSameOrBefore;
proto.isValid           = isValid$2;
proto.lang              = lang;
proto.locale            = locale;
proto.localeData        = localeData;
proto.max               = prototypeMax;
proto.min               = prototypeMin;
proto.parsingFlags      = parsingFlags;
proto.set               = stringSet;
proto.startOf           = startOf;
proto.subtract          = subtract;
proto.toArray           = toArray;
proto.toObject          = toObject;
proto.toDate            = toDate;
proto.toISOString       = toISOString;
proto.inspect           = inspect;
proto.toJSON            = toJSON;
proto.toString          = toString;
proto.unix              = unix;
proto.valueOf           = valueOf;
proto.creationData      = creationData;

//Year
proto.year       = getSetYear;
proto.isLeapYear = getIsLeapYear;

//Week Year
proto.weekYear    = getSetWeekYear;
proto.isoWeekYear = getSetISOWeekYear;

//Quarter
proto.quarter = proto.quarters = getSetQuarter;

//Month
proto.month       = getSetMonth;
proto.daysInMonth = getDaysInMonth;

//Week
proto.week           = proto.weeks        = getSetWeek;
proto.isoWeek        = proto.isoWeeks     = getSetISOWeek;
proto.weeksInYear    = getWeeksInYear;
proto.isoWeeksInYear = getISOWeeksInYear;

//Day
proto.date       = getSetDayOfMonth;
proto.day        = proto.days             = getSetDayOfWeek;
proto.weekday    = getSetLocaleDayOfWeek;
proto.isoWeekday = getSetISODayOfWeek;
proto.dayOfYear  = getSetDayOfYear;

//Hour
proto.hour = proto.hours = getSetHour;

//Minute
proto.minute = proto.minutes = getSetMinute;

//Second
proto.second = proto.seconds = getSetSecond;

//Millisecond
proto.millisecond = proto.milliseconds = getSetMillisecond;

//Offset
proto.utcOffset            = getSetOffset;
proto.utc                  = setOffsetToUTC;
proto.local                = setOffsetToLocal;
proto.parseZone            = setOffsetToParsedOffset;
proto.hasAlignedHourOffset = hasAlignedHourOffset;
proto.isDST                = isDaylightSavingTime;
proto.isLocal              = isLocal;
proto.isUtcOffset          = isUtcOffset;
proto.isUtc                = isUtc;
proto.isUTC                = isUtc;

//Timezone
proto.zoneAbbr = getZoneAbbr;
proto.zoneName = getZoneName;

//Deprecations
proto.dates  = deprecate('dates accessor is deprecated. Use date instead.', getSetDayOfMonth);
proto.months = deprecate('months accessor is deprecated. Use month instead', getSetMonth);
proto.years  = deprecate('years accessor is deprecated. Use year instead', getSetYear);
proto.zone   = deprecate('moment().zone is deprecated, use moment().utcOffset instead. http://momentjs.com/guides/#/warnings/zone/', getSetZone);
proto.isDSTShifted = deprecate('isDSTShifted is deprecated. See http://momentjs.com/guides/#/warnings/dst-shifted/ for more information', isDaylightSavingTimeShifted);

function createUnix (input) {
  return createLocal(input * 1000);
}

function createInZone () {
  return createLocal.apply(null, arguments).parseZone();
}

function preParsePostFormat (string) {
  return string;
}

var proto$1 = Locale.prototype;

proto$1.calendar        = calendar;
proto$1.longDateFormat  = longDateFormat;
proto$1.invalidDate     = invalidDate;
proto$1.ordinal         = ordinal;
proto$1.preparse        = preParsePostFormat;
proto$1.postformat      = preParsePostFormat;
proto$1.relativeTime    = relativeTime;
proto$1.pastFuture      = pastFuture;
proto$1.set             = set;

//Month
proto$1.months            =        localeMonths;
proto$1.monthsShort       =        localeMonthsShort;
proto$1.monthsParse       =        localeMonthsParse;
proto$1.monthsRegex       = monthsRegex;
proto$1.monthsShortRegex  = monthsShortRegex;

//Week
proto$1.week = localeWeek;
proto$1.firstDayOfYear = localeFirstDayOfYear;
proto$1.firstDayOfWeek = localeFirstDayOfWeek;

//Day of Week
proto$1.weekdays       =        localeWeekdays;
proto$1.weekdaysMin    =        localeWeekdaysMin;
proto$1.weekdaysShort  =        localeWeekdaysShort;
proto$1.weekdaysParse  =        localeWeekdaysParse;

proto$1.weekdaysRegex       =        weekdaysRegex;
proto$1.weekdaysShortRegex  =        weekdaysShortRegex;
proto$1.weekdaysMinRegex    =        weekdaysMinRegex;

//Hours
proto$1.isPM = localeIsPM;
proto$1.meridiem = localeMeridiem;

function get$1 (format, index, field, setter) {
  var locale = getLocale();
  var utc = createUTC().set(setter, index);
  return locale[field](utc, format);
}

function listMonthsImpl (format, index, field) {
  if (isNumber(format)) {
      index = format;
      format = undefined;
  }

  format = format || '';

  if (index != null) {
      return get$1(format, index, field, 'month');
  }

  var i;
  var out = [];
  for (i = 0; i < 12; i++) {
      out[i] = get$1(format, i, field, 'month');
  }
  return out;
}

//()
//(5)
//(fmt, 5)
//(fmt)
//(true)
//(true, 5)
//(true, fmt, 5)
//(true, fmt)
function listWeekdaysImpl (localeSorted, format, index, field) {
  if (typeof localeSorted === 'boolean') {
      if (isNumber(format)) {
          index = format;
          format = undefined;
      }

      format = format || '';
  } else {
      format = localeSorted;
      index = format;
      localeSorted = false;

      if (isNumber(format)) {
          index = format;
          format = undefined;
      }

      format = format || '';
  }

  var locale = getLocale(),
      shift = localeSorted ? locale._week.dow : 0;

  if (index != null) {
      return get$1(format, (index + shift) % 7, field, 'day');
  }

  var i;
  var out = [];
  for (i = 0; i < 7; i++) {
      out[i] = get$1(format, (i + shift) % 7, field, 'day');
  }
  return out;
}

function listMonths (format, index) {
  return listMonthsImpl(format, index, 'months');
}

function listMonthsShort (format, index) {
  return listMonthsImpl(format, index, 'monthsShort');
}

function listWeekdays (localeSorted, format, index) {
  return listWeekdaysImpl(localeSorted, format, index, 'weekdays');
}

function listWeekdaysShort (localeSorted, format, index) {
  return listWeekdaysImpl(localeSorted, format, index, 'weekdaysShort');
}

function listWeekdaysMin (localeSorted, format, index) {
  return listWeekdaysImpl(localeSorted, format, index, 'weekdaysMin');
}

getSetGlobalLocale('en', {
  dayOfMonthOrdinalParse: /\d{1,2}(th|st|nd|rd)/,
  ordinal : function (number) {
      var b = number % 10,
          output = (toInt(number % 100 / 10) === 1) ? 'th' :
          (b === 1) ? 'st' :
          (b === 2) ? 'nd' :
          (b === 3) ? 'rd' : 'th';
      return number + output;
  }
});

//Side effect imports
hooks.lang = deprecate('moment.lang is deprecated. Use moment.locale instead.', getSetGlobalLocale);
hooks.langData = deprecate('moment.langData is deprecated. Use moment.localeData instead.', getLocale);

var mathAbs = Math.abs;

function abs () {
  var data           = this._data;

  this._milliseconds = mathAbs(this._milliseconds);
  this._days         = mathAbs(this._days);
  this._months       = mathAbs(this._months);

  data.milliseconds  = mathAbs(data.milliseconds);
  data.seconds       = mathAbs(data.seconds);
  data.minutes       = mathAbs(data.minutes);
  data.hours         = mathAbs(data.hours);
  data.months        = mathAbs(data.months);
  data.years         = mathAbs(data.years);

  return this;
}

function addSubtract$1 (duration, input, value, direction) {
  var other = createDuration(input, value);

  duration._milliseconds += direction * other._milliseconds;
  duration._days         += direction * other._days;
  duration._months       += direction * other._months;

  return duration._bubble();
}

//supports only 2.0-style add(1, 's') or add(duration)
function add$1 (input, value) {
  return addSubtract$1(this, input, value, 1);
}

//supports only 2.0-style subtract(1, 's') or subtract(duration)
function subtract$1 (input, value) {
  return addSubtract$1(this, input, value, -1);
}

function absCeil (number) {
  if (number < 0) {
      return Math.floor(number);
  } else {
      return Math.ceil(number);
  }
}

function bubble () {
  var milliseconds = this._milliseconds;
  var days         = this._days;
  var months       = this._months;
  var data         = this._data;
  var seconds, minutes, hours, years, monthsFromDays;

  // if we have a mix of positive and negative values, bubble down first
  // check: https://github.com/moment/moment/issues/2166
  if (!((milliseconds >= 0 && days >= 0 && months >= 0) ||
          (milliseconds <= 0 && days <= 0 && months <= 0))) {
      milliseconds += absCeil(monthsToDays(months) + days) * 864e5;
      days = 0;
      months = 0;
  }

  // The following code bubbles up values, see the tests for
  // examples of what that means.
  data.milliseconds = milliseconds % 1000;

  seconds           = absFloor(milliseconds / 1000);
  data.seconds      = seconds % 60;

  minutes           = absFloor(seconds / 60);
  data.minutes      = minutes % 60;

  hours             = absFloor(minutes / 60);
  data.hours        = hours % 24;

  days += absFloor(hours / 24);

  // convert days to months
  monthsFromDays = absFloor(daysToMonths(days));
  months += monthsFromDays;
  days -= absCeil(monthsToDays(monthsFromDays));

  // 12 months -> 1 year
  years = absFloor(months / 12);
  months %= 12;

  data.days   = days;
  data.months = months;
  data.years  = years;

  return this;
}

function daysToMonths (days) {
  // 400 years have 146097 days (taking into account leap year rules)
  // 400 years have 12 months === 4800
  return days * 4800 / 146097;
}

function monthsToDays (months) {
  // the reverse of daysToMonths
  return months * 146097 / 4800;
}

function as (units) {
  if (!this.isValid()) {
      return NaN;
  }
  var days;
  var months;
  var milliseconds = this._milliseconds;

  units = normalizeUnits(units);

  if (units === 'month' || units === 'year') {
      days   = this._days   + milliseconds / 864e5;
      months = this._months + daysToMonths(days);
      return units === 'month' ? months : months / 12;
  } else {
      // handle milliseconds separately because of floating point math errors (issue #1867)
      days = this._days + Math.round(monthsToDays(this._months));
      switch (units) {
          case 'week'   : return days / 7     + milliseconds / 6048e5;
          case 'day'    : return days         + milliseconds / 864e5;
          case 'hour'   : return days * 24    + milliseconds / 36e5;
          case 'minute' : return days * 1440  + milliseconds / 6e4;
          case 'second' : return days * 86400 + milliseconds / 1000;
          // Math.floor prevents floating point math errors here
          case 'millisecond': return Math.floor(days * 864e5) + milliseconds;
          default: throw new Error('Unknown unit ' + units);
      }
  }
}

//TODO: Use this.as('ms')?
function valueOf$1 () {
  if (!this.isValid()) {
      return NaN;
  }
  return (
      this._milliseconds +
      this._days * 864e5 +
      (this._months % 12) * 2592e6 +
      toInt(this._months / 12) * 31536e6
  );
}

function makeAs (alias) {
  return function () {
      return this.as(alias);
  };
}

var asMilliseconds = makeAs('ms');
var asSeconds      = makeAs('s');
var asMinutes      = makeAs('m');
var asHours        = makeAs('h');
var asDays         = makeAs('d');
var asWeeks        = makeAs('w');
var asMonths       = makeAs('M');
var asYears        = makeAs('y');

function get$2 (units) {
  units = normalizeUnits(units);
  return this.isValid() ? this[units + 's']() : NaN;
}

function makeGetter(name) {
  return function () {
      return this.isValid() ? this._data[name] : NaN;
  };
}

var milliseconds = makeGetter('milliseconds');
var seconds      = makeGetter('seconds');
var minutes      = makeGetter('minutes');
var hours        = makeGetter('hours');
var days         = makeGetter('days');
var months       = makeGetter('months');
var years        = makeGetter('years');

function weeks () {
  return absFloor(this.days() / 7);
}

var round = Math.round;
var thresholds = {
  ss: 44,         // a few seconds to seconds
  s : 45,         // seconds to minute
  m : 45,         // minutes to hour
  h : 22,         // hours to day
  d : 26,         // days to month
  M : 11          // months to year
};

//helper function for moment.fn.from, moment.fn.fromNow, and moment.duration.fn.humanize
function substituteTimeAgo(string, number, withoutSuffix, isFuture, locale) {
  return locale.relativeTime(number || 1, !!withoutSuffix, string, isFuture);
}

function relativeTime$1 (posNegDuration, withoutSuffix, locale) {
  var duration = createDuration(posNegDuration).abs();
  var seconds  = round(duration.as('s'));
  var minutes  = round(duration.as('m'));
  var hours    = round(duration.as('h'));
  var days     = round(duration.as('d'));
  var months   = round(duration.as('M'));
  var years    = round(duration.as('y'));

  var a = seconds <= thresholds.ss && ['s', seconds]  ||
          seconds < thresholds.s   && ['ss', seconds] ||
          minutes <= 1             && ['m']           ||
          minutes < thresholds.m   && ['mm', minutes] ||
          hours   <= 1             && ['h']           ||
          hours   < thresholds.h   && ['hh', hours]   ||
          days    <= 1             && ['d']           ||
          days    < thresholds.d   && ['dd', days]    ||
          months  <= 1             && ['M']           ||
          months  < thresholds.M   && ['MM', months]  ||
          years   <= 1             && ['y']           || ['yy', years];

  a[2] = withoutSuffix;
  a[3] = +posNegDuration > 0;
  a[4] = locale;
  return substituteTimeAgo.apply(null, a);
}

//This function allows you to set the rounding function for relative time strings
function getSetRelativeTimeRounding (roundingFunction) {
  if (roundingFunction === undefined) {
      return round;
  }
  if (typeof(roundingFunction) === 'function') {
      round = roundingFunction;
      return true;
  }
  return false;
}

//This function allows you to set a threshold for relative time strings
function getSetRelativeTimeThreshold (threshold, limit) {
  if (thresholds[threshold] === undefined) {
      return false;
  }
  if (limit === undefined) {
      return thresholds[threshold];
  }
  thresholds[threshold] = limit;
  if (threshold === 's') {
      thresholds.ss = limit - 1;
  }
  return true;
}

function humanize (withSuffix) {
  if (!this.isValid()) {
      return this.localeData().invalidDate();
  }

  var locale = this.localeData();
  var output = relativeTime$1(this, !withSuffix, locale);

  if (withSuffix) {
      output = locale.pastFuture(+this, output);
  }

  return locale.postformat(output);
}

var abs$1 = Math.abs;

function toISOString$1() {
  // for ISO strings we do not use the normal bubbling rules:
  //  * milliseconds bubble up until they become hours
  //  * days do not bubble at all
  //  * months bubble up until they become years
  // This is because there is no context-free conversion between hours and days
  // (think of clock changes)
  // and also not between days and months (28-31 days per month)
  if (!this.isValid()) {
      return this.localeData().invalidDate();
  }

  var seconds = abs$1(this._milliseconds) / 1000;
  var days         = abs$1(this._days);
  var months       = abs$1(this._months);
  var minutes, hours, years;

  // 3600 seconds -> 60 minutes -> 1 hour
  minutes           = absFloor(seconds / 60);
  hours             = absFloor(minutes / 60);
  seconds %= 60;
  minutes %= 60;

  // 12 months -> 1 year
  years  = absFloor(months / 12);
  months %= 12;


  // inspired by https://github.com/dordille/moment-isoduration/blob/master/moment.isoduration.js
  var Y = years;
  var M = months;
  var D = days;
  var h = hours;
  var m = minutes;
  var s = seconds;
  var total = this.asSeconds();

  if (!total) {
      // this is the same as C#'s (Noda) and python (isodate)...
      // but not other JS (goog.date)
      return 'P0D';
  }

  return (total < 0 ? '-' : '') +
      'P' +
      (Y ? Y + 'Y' : '') +
      (M ? M + 'M' : '') +
      (D ? D + 'D' : '') +
      ((h || m || s) ? 'T' : '') +
      (h ? h + 'H' : '') +
      (m ? m + 'M' : '') +
      (s ? s + 'S' : '');
}

var proto$2 = Duration.prototype;

proto$2.isValid        = isValid$1;
proto$2.abs            = abs;
proto$2.add            = add$1;
proto$2.subtract       = subtract$1;
proto$2.as             = as;
proto$2.asMilliseconds = asMilliseconds;
proto$2.asSeconds      = asSeconds;
proto$2.asMinutes      = asMinutes;
proto$2.asHours        = asHours;
proto$2.asDays         = asDays;
proto$2.asWeeks        = asWeeks;
proto$2.asMonths       = asMonths;
proto$2.asYears        = asYears;
proto$2.valueOf        = valueOf$1;
proto$2._bubble        = bubble;
proto$2.get            = get$2;
proto$2.milliseconds   = milliseconds;
proto$2.seconds        = seconds;
proto$2.minutes        = minutes;
proto$2.hours          = hours;
proto$2.days           = days;
proto$2.weeks          = weeks;
proto$2.months         = months;
proto$2.years          = years;
proto$2.humanize       = humanize;
proto$2.toISOString    = toISOString$1;
proto$2.toString       = toISOString$1;
proto$2.toJSON         = toISOString$1;
proto$2.locale         = locale;
proto$2.localeData     = localeData;

//Deprecations
proto$2.toIsoString = deprecate('toIsoString() is deprecated. Please use toISOString() instead (notice the capitals)', toISOString$1);
proto$2.lang = lang;

//Side effect imports

//FORMATTING

addFormatToken('X', 0, 0, 'unix');
addFormatToken('x', 0, 0, 'valueOf');

//PARSING

addRegexToken('x', matchSigned);
addRegexToken('X', matchTimestamp);
addParseToken('X', function (input, array, config) {
  config._d = new Date(parseFloat(input, 10) * 1000);
});
addParseToken('x', function (input, array, config) {
  config._d = new Date(toInt(input));
});

//Side effect imports


hooks.version = '2.18.1';

setHookCallback(createLocal);

hooks.fn                    = proto;
hooks.min                   = min;
hooks.max                   = max;
hooks.now                   = now;
hooks.utc                   = createUTC;
hooks.unix                  = createUnix;
hooks.months                = listMonths;
hooks.isDate                = isDate;
hooks.locale                = getSetGlobalLocale;
hooks.invalid               = createInvalid;
hooks.duration              = createDuration;
hooks.isMoment              = isMoment;
hooks.weekdays              = listWeekdays;
hooks.parseZone             = createInZone;
hooks.localeData            = getLocale;
hooks.isDuration            = isDuration;
hooks.monthsShort           = listMonthsShort;
hooks.weekdaysMin           = listWeekdaysMin;
hooks.defineLocale          = defineLocale;
hooks.updateLocale          = updateLocale;
hooks.locales               = listLocales;
hooks.weekdaysShort         = listWeekdaysShort;
hooks.normalizeUnits        = normalizeUnits;
hooks.relativeTimeRounding = getSetRelativeTimeRounding;
hooks.relativeTimeThreshold = getSetRelativeTimeThreshold;
hooks.calendarFormat        = getCalendarFormat;
hooks.prototype             = proto;

return hooks;

})));
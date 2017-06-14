---------------------------------------------------------------------->
-- 脚本名称:	scripts/EquipMagicChange/MagicChange.lua
-- 更新时间:	2013-9-16 11:05:54
-- 更新用户:	zhengyu
-- 脚本说明:	
----------------------------------------------------------------------<
Include("scripts/Map/装备洗练/include/洗炼_距离判断处理.lh")

tCof_Quality = {	--装备品质系数
	[1] = 1,
	[2] = 1.4,
	[3] = 1.6,
	[4] = 1.8,
	[5] = 2.5
}
tCof_Subtype = {	--装备部位系数
	[0] = 1.2,
	[1] = 0.6,
	[2] = 1,
	[3] = 0.9,
	[4] = 0.5,
	[5] = 0.5,
	[6] = 0.7,
	[7] = 0.5,
	[8] = 1,
	[9] = 0.7,
	[10] = 0.7,
}
tBreakRandomOutItem = {
	--累积概率,道具类型,道具ID
	{1, 5, 20571}, -- 10000为底的概率获得惊喜道具，这里是：0.1%，获得一个
	{6, 5, 20572},
	{16, 5, 20573},
	{36, 5, 20574},
	{336, 5, 20575},
}

local tSetIDAll = {
	[2]= 1,
	[3]= 1,
	[4]= 1,
	[5]= 1,
	[6]= 1,
	[7]= 1,
	[8]= 1,
	[9]= 1,
	[10]= 1,
	[11]= 1,
	[12]= 1,
	[13]= 1,
	[14]= 1,
	[15]= 1,
	[16]= 1,
	[17]= 1,
	[18]= 1,
	[19]= 1,
	[20]= 1,
	[21]= 1,
	[22]= 1,
	[23]= 1,
	[24]= 1,
	[25]= 1,
	[26]= 1,
	[27]= 1,
	[28]= 1,
	[29]= 1,
	[30]= 1,
	[31]= 1,
	[34]= 1,
	[35]= 1,
	[36]= 1,
	[37]= 1,
	[38]= 1,
	[39]= 1,
	[40]= 1,
	[41]= 1,
	[42]= 1,
	[43]= 1,
	[65]= 1,
	[66]= 1,
	[67]= 1,
	[68]= 1,
	[69]= 1,
	[70]= 1,
	[71]= 1,
	[72]= 1,
	[73]= 1,
	[74]= 1,
	[75]= 1,
	[76]= 1,
	[77]= 1,
	[78]= 1,
	[79]= 1,
	[80]= 1,
	[81]= 1,
	[82]= 1,
	[83]= 1,
	[84]= 1,
	[85]= 1,
	[86]= 1,
	[87]= 1,
	[88]= 1,
	[89]= 1,
	[90]= 1,
	[91]= 1,
	[92]= 1,
	[93]= 1,
	[94]= 1,
	[95]= 1,
	[96]= 1,
	[97]= 1,
	[98]= 1,
	[99]= 1,
	[100]= 1,
	[101]= 1,
	[102]= 1,
	[103]= 1,
	[104]= 1,
	[105]= 1,
	[106]= 1,
	[107]= 1,
	[108]= 1,
	[109]= 1,
	[110]= 1,
	[111]= 1,
	[112]= 1,
	[113]= 1,
	[114]= 1,
	[115]= 1,
	[116]= 1,
	[117]= 1,
	[118]= 1,
	[119]= 1,
	[120]= 1,
	[121]= 1,
	[122]= 1,
	[137]= 1,
	[138]= 1,
	[139]= 1,
	[140]= 1,
	[141]= 1,
	[142]= 1,
	[143]= 1,
	[144]= 1,
	[158]= 1,
	[159]= 1,
	[160]= 1,
	[161]= 1,
	[162]= 1,
	[227]= 1,
	[228]= 1,
	[229]= 1,
	[230]= 1,
	[231]= 1,
	[232]= 1,
	[233]= 1,
	[234]= 1,
	[235]= 1,
	[236]= 1,
	[237]= 1,
	[238]= 1,
	[239]= 1,
	[240]= 1,
	[241]= 1,
	[242]= 1,
	[243]= 1,
	[244]= 1,
	[245]= 1,
	[246]= 1,
	[247]= 1,
	[248]= 1,
	[249]= 1,
	[250]= 1,
	[251]= 1,
	[252]= 1,
	[275]= 1,
	[276]= 1,
	[277]= 1,
	[278]= 1,
	[279]= 1,
	[280]= 1,
	[281]= 1,
	[282]= 1,
	[283]= 1,
	[284]= 1,
	[285]= 1,
	[297]= 1,
	[298]= 1,
	[299]= 1,
	[300]= 1,
	[301]= 1,
	[302]= 1,
	[303]= 1,
	[304]= 1,
	[305]= 1,
	[306]= 1,
	[307]= 1,
	[308]= 1,
	[309]= 1,
	[310]= 1,
	[311]= 1,
	[312]= 1,
	[313]= 1,
	[314]= 1,
	[315]= 1,
	[316]= 1,
	[317]= 1,
	[318]= 1,
	[363]= 1,
	[364]= 1,
	[365]= 1,
	[366]= 1,
	[367]= 1,
	[368]= 1,
	[369]= 1,
	[370]= 1,
	[383]= 1,
	[384]= 1,
	[389]= 1,
	[390]= 1,
	[391]= 1,
	[392]= 1,
	[393]= 1,
	[394]= 1,
	[407]= 1,
	[408]= 1,
	[409]= 1,
	[410]= 1,
	[411]= 1,
	[412]= 1,
	[413]= 1,
	[414]= 1,
	[415]= 1,
	[416]= 1,
	[417]= 1,
	[418]= 1,
	[419]= 1,
	[420]= 1,
	[421]= 1,
	[422]= 1,
	[423]= 1,
	[424]= 1,
	[425]= 1,
	[426]= 1,
	[427]= 1,
	[428]= 1,
	[429]= 1,
	[430]= 1,
	[431]= 1,
	[432]= 1,
	[452]= 1,
	[453]= 1,
	[454]= 1,
	[455]= 1,
	[456]= 1,
	[457]= 1,
	[458]= 1,
	[459]= 1,
	[460]= 1,
	[461]= 1,
	[462]= 1,
	[463]= 1,
	[464]= 1,
	[465]= 1,
	[466]= 1,
	[467]= 1,
	[468]= 1,
	[469]= 1,
	[470]= 1,
	[471]= 1,
	[472]= 1,
	[473]= 1,
	[474]= 1,
	[475]= 1,
	[476]= 1,
	[477]= 1,
	[478]= 1,
	[479]= 1,
	[480]= 1,
	[481]= 1,
	[482]= 1,
	[483]= 1,
	[484]= 1,
	[485]= 1,
	[486]= 1,
	[487]= 1,
	[488]= 1,
	[489]= 1,
	[490]= 1,
	[491]= 1,
	[492]= 1,
	[493]= 1,
	[494]= 1,
	[495]= 1,
	[496]= 1,
	[516]= 1,
	[517]= 1,
	[518]= 1,
	[519]= 1,
	[524]= 1,
	[525]= 1,
	[528]= 1,
	[529]= 1,
	[530]= 1,
	[531]= 1,
	[532]= 1,
	[533]= 1,
	[534]= 1,
	[535]= 1,
	[538]= 1,
	[539]= 1,
	[540]= 1,
	[543]= 1,
	[544]= 1,
	[545]= 1,
	[546]= 1,
	[547]= 1,
	[548]= 1,
	[549]= 1,
	[550]= 1,
	[551]= 1,
	[552]= 1,
	[553]= 1,
	[554]= 1,
	[555]= 1,
	[556]= 1,
	[557]= 1,
	[558]= 1,
	[559]= 1,
	[560]= 1,
	[561]= 1,
	[562]= 1,
	[563]= 1,
	[564]= 1,
	[565]= 1,
	[566]= 1,
	[567]= 1,
	[568]= 1,
	[569]= 1,
	[570]= 1,
	[571]= 1,
	[572]= 1,
	[573]= 1,
	[574]= 1,
	[575]= 1,
	[576]= 1,
	[577]= 1,
	[578]= 1,
	[579]= 1,
	[580]= 1,
	[581]= 1,
	[582]= 1,
	[583]= 1,
	[584]= 1,
	[585]= 1,
	[586]= 1,
	[617]= 1,
	[618]= 1,
	[623]= 1,
	[624]= 1,
	[625]= 1,
	[626]= 1,
	[627]= 1,
	[628]= 1,
	[631]= 1,
	[632]= 1,
	[633]= 1,
	[635]= 1,
	[638]= 1,
	[639]= 1,
	[640]= 1,
	[642]= 1,
	[643]= 1,
	[644]= 1,
	[645]= 1,
	[666]= 1,
	[667]= 1,
	[668]= 1,
	[669]= 1,
	[670]= 1,
	[671]= 1,
	[672]= 1,
	[673]= 1,
	[674]= 1,
	[675]= 1,
	[676]= 1,
	[677]= 1,
	[678]= 1,
	[679]= 1,
	[680]= 1,
	[681]= 1,
	[682]= 1,
	[683]= 1,
	[684]= 1,
	[685]= 1,
	[686]= 1,
	[687]= 1,
	[688]= 1,
	[689]= 1,
	[690]= 1,
	[691]= 1,
	[692]= 1,
	[693]= 1,
	[694]= 1,
	[695]= 1,
	[696]= 1,
	[697]= 1,
	[698]= 1,
	[699]= 1,
	[700]= 1,
	[701]= 1,
	[717]= 1,
	[718]= 1,
	[719]= 1,
	[720]= 1,
	[721]= 1,
	[722]= 1,
	[723]= 1,
	[724]= 1,
	[725]= 1,
	[726]= 1,
	[727]= 1,
	[728]= 1,
	[729]= 1,
	[730]= 1,
	[731]= 1,
	[732]= 1,
	[733]= 1,
	[734]= 1,
	[735]= 1,
	[736]= 1,
	[737]= 1,
	[738]= 1,
	[739]= 1,
	[740]= 1,
	[741]= 1,
	[742]= 1,
	[743]= 1,
	[744]= 1,
	[745]= 1,
	[746]= 1,
	[762]= 1,
	[763]= 1,
	[764]= 1,
	[765]= 1,
	[766]= 1,
	[767]= 1,
	[768]= 1,
	[769]= 1,
	[770]= 1,
	[771]= 1,
	[772]= 1,
	[773]= 1,
	[774]= 1,
	[775]= 1,
	[776]= 1,
	[777]= 1,
	[778]= 1,
	[779]= 1,
	[780]= 1,
	[781]= 1,
	[782]= 1,
	[783]= 1,
	[784]= 1,
	[785]= 1,
	[786]= 1,
	[787]= 1,
	[788]= 1,
	[789]= 1,
	[790]= 1,
	[791]= 1,
	[792]= 1,
	[793]= 1,
	[794]= 1,
	[795]= 1,
	[796]= 1,
	[797]= 1,
	[798]= 1,
	[799]= 1,
	[800]= 1,
	[801]= 1,
	[802]= 1,
	[803]= 1,
	[804]= 1,
	[805]= 1,
	[806]= 1,
	[807]= 1,
	[808]= 1,
	[809]= 1,
	[810]= 1,
	[811]= 1,
	[812]= 1,
	[813]= 1,
	[814]= 1,
	[815]= 1,
	[816]= 1,
	[817]= 1,
	[818]= 1,
	[819]= 1,
	[820]= 1,
	[821]= 1,
	[822]= 1,
	[823]= 1,
	[824]= 1,
	[825]= 1,
	[826]= 1,
	[827]= 1,
	[828]= 1,
	[829]= 1,
	[830]= 1,
	[831]= 1,
	[832]= 1,
	[833]= 1,
	[834]= 1,
	[835]= 1,
	[836]= 1,
	[837]= 1,
	[838]= 1,
	[839]= 1,
	[840]= 1,
	[841]= 1,
	[842]= 1,
	[843]= 1,
	[844]= 1,
	[845]= 1,
	[846]= 1,
	[847]= 1,
	[848]= 1,
	[849]= 1,
	[850]= 1,
	[851]= 1,
	[852]= 1,
	[853]= 1,
	[854]= 1,
	[855]= 1,
	[856]= 1,
	[857]= 1,
	[858]= 1,
	[859]= 1,
	[860]= 1,
	[861]= 1,
	[862]= 1,
	[863]= 1,
	[864]= 1,
	[865]= 1,
	[866]= 1,
	[867]= 1,
	[868]= 1,
	[869]= 1,
	[870]= 1,
	[871]= 1,
	[872]= 1,
	[873]= 1,
	[874]= 1,
	[875]= 1,
	[876]= 1,
	[877]= 1,
	[878]= 1,
	[879]= 1,
	[880]= 1,
	[881]= 1,
	[882]= 1,
	[883]= 1,
	[884]= 1,
	[993]= 1,
	[994]= 1,
	[995]= 1,
	[996]= 1,
	[997]= 1,
	[998]= 1,
	[999]= 1,
	[1000]= 1,
	[1001]= 1,
	[1002]= 1,
	[1003]= 1,
	[1004]= 1,
	[1005]= 1,
	[1006]= 1,
	[1007]= 1,
	[1008]= 1,
	[1009]= 1,
	[1010]= 1,
	[1011]= 1,
	[1012]= 1,
	[1013]= 1,
	[1014]= 1,
	[1015]= 1,
	[1016]= 1,
	[1017]= 1,
	[1018]= 1,
	[1019]= 1,
	[1020]= 1,
	[1021]= 1,
	[1022]= 1,
	[1023]= 1,
	[1024]= 1,
	[1025]= 1,
	[1026]= 1,
	[1027]= 1,
	[1028]= 1,
	[1029]= 1,
	[1030]= 1,
	[1031]= 1,
	[1032]= 1,
	[1033]= 1,
	[1034]= 1,
	[1035]= 1,
	[1036]= 1,
	[1037]= 1,
	[1038]= 1,
	[1039]= 1,
	[1040]= 1,
	[1041]= 1,
	[1042]= 1,
	[1043]= 1,
	[1044]= 1,
	[1045]= 1,
	[1046]= 1,
	[1047]= 1,
	[1048]= 1,
	[1049]= 1,
	[1050]= 1,
	[1051]= 1,
	[1052]= 1,
	[1053]= 1,
	[1054]= 1,
	[1055]= 1,
	[1122]= 1,
	[1123]= 1,
	[1124]= 1,
	[1125]= 1,
	[1126]= 1,
	[1127]= 1,
	[1128]= 1,
	[1129]= 1,
	[1130]= 1,
	[1131]= 1,
	[1132]= 1,
	[1133]= 1,
	[1134]= 1,
	[1135]= 1,
	[1136]= 1,
	[1137]= 1,
	[1142]= 1,
	[1143]= 1,
	[1148]= 1,
	[1149]= 1,
	[1150]= 1,
	[1152]= 1,
	[1153]= 1,
	[1154]= 1,
	[1155]= 1,
	[1156]= 1,
	[1157]= 1,
	[1158]= 1,
	[1159]= 1,
	[1162]= 1,
	[1163]= 1,
	[1164]= 1,
	[1165]= 1,
	[1166]= 1,
	[1167]= 1,
	[1168]= 1,
	[1171]= 1,
	[1174]= 1,
	[1175]= 1,
	[1176]= 1,
	[1177]= 1,
	[1178]= 1,
	[1181]= 1,
	[1182]= 1,
	[1183]= 1,
	[1184]= 1,
	[1185]= 1,
	[1189]= 1,
	[1190]= 1,
	[1191]= 1,
	[1192]= 1,
	[1194]= 1,
	[1196]= 1,
	[1199]= 1,
	[1201]= 1,
	[1203]= 1,
	[1204]= 1,
	[1205]= 1,
	[1206]= 1,
	[1207]= 1,
	[1209]= 1,
	[1211]= 1,
	[1212]= 1,
	[1213]= 1,
	[1214]= 1,
	[1215]= 1,
	[1218]= 1,

}

local tBreakItemID_Subtype = {	--装备部位系数
	[0] = 21532,
	[2] = 21528,
	[3] = 21527,
	[6] = 21530,
	[9] = 21531,
	[10] = 21529,
}

--天人合一
local nBuffId_TRHY = 6765
local nBuffLv_TRHY = 1
--鸿运当头
local nBuffId_HYDT = 6766
local nBuffLv_HYDT = 1
--福星高照
local nBuffId_FXGZ = 6767
local nBuffLv_FXGZ = 1
--福至心灵
local nBuffId_FZXL = 6769
local nBuffLv_FZXL = 1
--水到渠成
local nBuffId_SDQC = 6768
local nBuffLv_SDQC = 1

function Init()
	Log("EquipMagicChange Init.")
	--洗炼消耗道具注册
	RegisterEquipMagicChangeCostItem(0, 5, 20553)

	--分解装备产出的道具注册
	--RegisterEquipMagicBreakOutItem(0, 5, 20556) 

	--分解装备产出的惊喜道具注册
	--RegisterEquipMagicBreakRandomOutItem(1, 5, 20571) -- 10000为底的概率获得惊喜道具，这里是：0.1%，获得一个，概率为累积概率
	--RegisterEquipMagicBreakRandomOutItem(6, 5, 20572) --
	--RegisterEquipMagicBreakRandomOutItem(16, 5, 20573)
	--RegisterEquipMagicBreakRandomOutItem(36, 5, 20574)
	--RegisterEquipMagicBreakRandomOutItem(336, 5, 20575)

end

function RandomChangeLevel(player, item, nCostLevel)-- 这个函数是洗练结果的随机函数，参数为：玩家，装备道具，消费等级 
	------------------
	local nFlag = CheckPointData_Equip_Magic_Change(player)
	-- nFlag:此参数值为0 时候，说明在对应的灵穴附近 
	------------------
	local tResult = { --各种投入下洗练的转化成果及概率
		--转化百分比(%),普通洗练累积概率(*10000),灵穴洗练累积概率(*10000)
		{60, 300, 200, },		--	一品
		{65, 800, 700, },		--	二品
		{70, 1800, 1500, },	--	三品
		{75, 3800, 3000, },	--	四品
		{80, 6300, 5500, },	--	五品
		{85, 8100, 7500, },	--	六品	
		{90, 9100, 8700, },	--	七品	
		{95, 9700, 9600, },	--	八品
		{100, 10000, 10000, },--	九品
	}
	
	local nLevel = 60
	local nNum = Random(10000)
	
	if nFlag == 0 then
		for _, v in pairs(tResult) do
			if nNum <= v[3] then
				nLevel = v[1]
				break
			end
		end
	else
		for _, v in pairs(tResult) do
			if nNum <= v[2] then
				nLevel = v[1]
				break
			end
		end
	end

	--惊喜道具效果处理------------------------------------------------
	--天人合一--下一次洗炼时，100%获得“九品转化”的洗炼成果。
	local buff_TRHY = player.GetBuff(nBuffId_TRHY, nBuffLv_TRHY)
	if buff_TRHY then
		nLevel = 100
	end
	--鸿运当头--下一次洗炼时，洗炼成果额外提升3个档次。
	local buff_HYDT = player.GetBuff(nBuffId_HYDT, nBuffLv_HYDT)
	if buff_HYDT then
		nLevel = math.min(100, nLevel + 3 * 5)
	end
	--福星高照--下一次洗炼时，洗炼成果额外提升2个档次。
	local buff_FXGZ = player.GetBuff(nBuffId_FXGZ, nBuffLv_FXGZ)
	if buff_FXGZ then
		nLevel = math.min(100, nLevel + 2 * 5)
	end
	--福至心灵--下一次洗炼时，洗炼成果额外提升1个档次。
	local buff_FZXL = player.GetBuff(nBuffId_FZXL, nBuffLv_FZXL)
	if buff_FZXL then
		nLevel = math.min(100, nLevel + 1 * 5)
	end
	--妙手偶得

	if not player.IsAchievementAcquired(3843) then
		if nLevel >= 100 then
			player.AcquireAchievement(3843)
		end
	end
	-------------------------------------------------------------------
	return nLevel
end

function GetCostItemCount(player, item, nCostLevel)-- 这个函数为获取洗练道具的消耗，对应Init时候注册的0-2的道具。返回道具需要消耗数量

	local nTotalValue = math.max(117 * 4 + (item.nLevel-15) * 400 * tCof_Quality[item.nQuality] * tCof_Subtype[item.nSub] * 130 / 88, 1000) 	
	local nItemCount1 = math.floor(nTotalValue / 2000 / 30 + 0.5)
	local nItemCount2 = 0
	local nItemCount3 = 0
	
	--惊喜道具效果处理------------------------------------------------
	--水到渠成--下一次洗炼时，消耗的材料和修为减半。
	local buff_SDQC = player.GetBuff(nBuffId_SDQC, nBuffLv_SDQC)
	if buff_SDQC then
		nItemCount1 = math.floor(nItemCount1 / 2 + 0.5)
		nItemCount2 = math.floor(nItemCount2 / 2 + 0.5)
		nItemCount3 = math.floor(nItemCount3 / 2 + 0.5)
	end
	
	-------------------------------------------------------------------
	return nItemCount1, nItemCount2, nItemCount3
end

function CanChange(player, item)--是否可以洗炼

	if 1 then	-- 2015.10.18 洗练屏蔽
		return false
	end
	------------------------------
	local bFlag = CheckNPCandDOODAD_Equip_Magic_Change(player)
	-- bFlag:此参数值为true 时候，说明在NPC或者DOODAD附近，为false时候，说明不在附近。
	--------------------------------
	--提示距离
	if not bFlag then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 5947), 4)
		bFlag = true
	end
	-----------------------------
	--洗炼安全阀门，活动213开关
	local dwActivityID = 213
	local StateInfo = GetActivityState(dwActivityID)
	if not StateInfo then 
		return false
	end 
	if not (StateInfo == ACTIVITY_STATE.NORMAL_ON or StateInfo == ACTIVITY_STATE.RECOVER_ON) then
		player.SendSystemMessage(GetEditorString(6, 226))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 227), 4)
		return false
	end
	-----------------------------
	return bFlag
end

function GetCostTrain(player, item, nCostLevel)-- 这个函数为获取洗练的修为
	local nCostTrain = 0
	local nTotalValue = math.max(117 * 4 + (item.nLevel-15) * 400 * tCof_Quality[item.nQuality] * tCof_Subtype[item.nSub] * 130 / 88, 1000) 
	
	nCostTrain = math.floor(nTotalValue * 100 / 10000 / 100 + 0.5) * 100
	
	--惊喜道具效果处理------------------------------------------------
	--水到渠成--下一次洗炼时，消耗的材料和修为减半。
	local buff_SDQC = player.GetBuff(nBuffId_SDQC, nBuffLv_SDQC)
	if buff_SDQC then
		nCostTrain = math.floor(nCostTrain / 2 + 0.5)
	end

	-------------------------------------------------------------------
	return nCostTrain
end

function CanReset(player, item)--是否可以回炼

	if 1 then	-- 2015.10.18 洗练屏蔽
		return false
	end
	
	------------------------------
	local bFlag = CheckNPCandDOODAD_Equip_Magic_Change(player)
	-- bFlag:此参数值为true 时候，说明在NPC或者DOODAD附近，为false时候，说明不在附近。
	--------------------------------
	--提示距离
	if not bFlag then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(7, 5947), 4)
		bFlag = true
	end
	-----------------------------
	--洗炼安全阀门，活动213开关
	local dwActivityID = 213
	local StateInfo = GetActivityState(dwActivityID)
	if not StateInfo then 
		return false
	end 
	if not (StateInfo == ACTIVITY_STATE.NORMAL_ON or StateInfo == ACTIVITY_STATE.RECOVER_ON) then
		player.SendSystemMessage(GetEditorString(6, 226))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(6, 227), 4)
		return false
	end
	-----------------------------
	return bFlag
end

function GetResetCost(player, item)-- 这个函数为获取还原的修为消耗
	return 10000
end

function GetResetCostItem(player, item)--回炼需要投入的道具，返回值（类型，索引，数量）
	local nTotalValue = math.max(117 * 4 + (item.nLevel-15) * 400 * tCof_Quality[item.nQuality] * tCof_Subtype[item.nSub] * 130 / 88, 1000) 	
	local nItemCount = math.floor(nTotalValue / 2000 / 50 + 0.5)
	
	return 5, 20553, nItemCount
end

--[[
function GetBreakOutItemCount(player, item) -- 这里是分解装备的函数，用来获取注册的3个道具的数量	
	
	local nTotalValue = math.max(117 * 4 + (item.nLevel-15) * 400 * tCof_Quality[item.nQuality] * tCof_Subtype[item.nSub] * 130 / 88, 1000)
	
	if item.nQuality <= 2 then
		nTotalValue = math.max(nTotalValue * 0.6, 1000)
	elseif item.nQuality == 3 then
		nTotalValue = math.max(nTotalValue * 0.8, 1000)
	end
		
	local nItemCount1 = math.floor(nTotalValue / 2000 + 0.5)
	local nItemCount2 = 0
	local nItemCount3 = 0
	
	return nItemCount1, nItemCount2, nItemCount3
end
--]]
function ChangeDone(player, item)
	if player.nMoveState == MOVE_STATE.ON_SIT then
		player.DoAction(0, 13029)
	end
	----------------
	-----------------
	--[11704]随心赋器魂
	local nQuestIndex = player.GetQuestIndex(11704)
	local nQuestPhase = player.GetQuestPhase(11704)
	if nQuestIndex and nQuestPhase == 1 then
		local nNum = player.GetQuestValue(nQuestIndex, 1)
		if nNum ~= 1 then
			player.SetQuestValue(nQuestIndex, 1, 1)
		end
	end
	-----------------
	--第一次洗炼
	if not player.IsAchievementAcquired(3840) then
		player.AcquireAchievement(3840)
	end
	--洗炼百次
	player.AddAchievementCount(3845, 1)
	
	--风水宝地
	local nFlag = CheckPointData_Equip_Magic_Change(player)
	-- nFlag:此参数值为0 时候，说明在对应的灵穴附近 
	if nFlag == 0 then
		player.AcquireAchievement(3842)
	end
	----------------
	--天人合一
	local buff_TRHY = player.GetBuff(nBuffId_TRHY, nBuffLv_TRHY)
	if buff_TRHY then
		player.DelBuff(nBuffId_TRHY, nBuffLv_TRHY)
	end
	--鸿运当头
	local buff_HYDT = player.GetBuff(nBuffId_HYDT, nBuffLv_HYDT)
	if buff_HYDT then
		player.DelBuff(nBuffId_HYDT, nBuffLv_HYDT)
	end
	--福星高照
	local buff_FXGZ = player.GetBuff(nBuffId_FXGZ, nBuffLv_FXGZ)
	if buff_FXGZ then
		player.DelBuff(nBuffId_FXGZ, nBuffLv_FXGZ)
	end
	--福至心灵
	local buff_FZXL = player.GetBuff(nBuffId_FZXL, nBuffLv_FZXL)
	if buff_FZXL then
		player.DelBuff(nBuffId_FZXL, nBuffLv_FZXL)
	end
	--水到渠成
	local buff_SDQC = player.GetBuff(nBuffId_SDQC, nBuffLv_SDQC)
	if buff_SDQC then
		player.DelBuff(nBuffId_SDQC, nBuffLv_SDQC)
	end
end

function ResetDone(player, item)
	if player.nMoveState == MOVE_STATE.ON_SIT then
		player.DoAction(0, 13029)
	end
	--第一回炼
	if not player.IsAchievementAcquired(3841) then
		player.AcquireAchievement(3841)
	end
	--回炼百次
	player.AddAchievementCount(3846, 1)
end

function BreakDone(player, item)
	if player.GetFreeRoomSize() > 0 then
		local nRate = 10000
		local nTotalValue = math.min(math.max(117 * 4 + (item.nLevel-15) * 400 * tCof_Quality[item.nQuality] * tCof_Subtype[item.nSub] * 130 / 88, 1000), 300000)
		
		nRate = math.floor(nRate / nTotalValue * 300000 + 0.5)
		if item.nQuality <= 3 then
			nRate = nRate * 10
		end
		
		local nNum = Random(nRate)	
		for _, v in pairs(tBreakRandomOutItem) do
			if nNum <= v[1] then
				player.AddItem(v[2], v[3], 1)		
				local RandomOutItem = GetItemInfo(v[2], v[3])
				RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_GREEN", GetEditorString(6, 111)..RandomOutItem.szName..GetEditorString(0, 4453), 4)
				
				break
			end
		end
		local nCurrentTime = GetCurrentTime()
		local nEndTime = DateToTime(2014, 11, 18, 12, 0, 0)
		if nCurrentTime > nEndTime then
			local nCof_Num = item.nLevel * tCof_Quality[item.nQuality] * tCof_Subtype[item.nSub]
			local nNum_Bake = math.max(math.floor(nCof_Num / 460), 1)
			if (nNum + nCof_Num) >= 4000 and tSetIDAll[item.dwSetID] == 1 then
				if tBreakItemID_Subtype[item.nSub] ~= nil and nCof_Num >= 140 and player.CanAddItem(5,tBreakItemID_Subtype[item.nSub],nNum_Bake) == ITEM_RESULT_CODE.SUCCESS then	
					player.AddItem(5, tBreakItemID_Subtype[item.nSub], nNum_Bake)
					local RandomOutItem = GetItemInfo(5, tBreakItemID_Subtype[item.nSub])
					RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_GREEN", GetEditorString(6, 9779)..RandomOutItem.szName..GetEditorString(0, 4453), 4)
				end
			end
		end
	end		
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
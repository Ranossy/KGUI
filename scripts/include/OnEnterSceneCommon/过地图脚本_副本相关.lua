---------------------------------------------------------------------->
-- �ű�����:	scripts/Include/OnEnterSceneCommon/����ͼ�ű�_�������.lua
-- ����ʱ��:	2017/5/9 18:51:57
-- �����û�:	zhengfeng6
-- �ű�˵��:
----------------------------------------------------------------------<
-- �˺�������ʱ���ѵ�20MS���������
-- Include("scripts/Map/����ͨ��/include/FBTimeRankData.lua")
Include("scripts/Include/OnEnterSceneCommon/Player_EnterSceneCommon_Include.lua")

tItem_DMG = {20235, 20236, 20233, 20234}
tDun_BuffList = {
	{203, 1}, {106, 1}, {108, 1},
}
tBuffDongTaiZhenFa = {3678, 3679, 3680, 3681, 3682, 3683, 3713, 3714}
tItem_dongtai = {11644, 11645, 11646, 11647, 11648, 11649, 11650, 11651, 11652, 11795, 11796, 11797, 11814, 21097, 21098, 21099, 21100, 21101, 21102, 21103, 21104, 21105}
tItem_nanzhao = {18604}
tItemNumDHG = {}
tZHULONGBUFF = {3616, 3617, 3646, 3647, 3722, 3720, 3721, 3729, 3728, 3731, 3723, 3724, 3726, 3727, 3725, 3730, 3732, 3733, 3734, 3735,
	3620, 3800, 3765, 3753, 3779
}
tDAMINGGONGBUFF = {
	5397, 5717, 5403, 5404, 5405,
	5406, 5407, 5409, 5396, 5500,
	5505, 5515, 5513, 5516, 5522,
	5672, 5491, 5600, 5601, 5486,
	5493, 5568, 5569, 5567, 5570,
	5571, 5573, 5574, 5575, 5576,
	5579, 5712, 5711, 4665, 6006,
	6189, 6180, 5597, 5983
}
tXUEZHANTIANCEBUFF = {
	6907, 6908, 6900,
	6893, 6740, 6736,
	6677, 6741, 4166,
	7148, 7149, 7150,
	6778, 7184, 6869,
}
tQINHUANGLINGBUFF = {
	7382, 7383, 7396,
	7399, 7417, 7435,
	7464, 7501, 7513,
	7537, 7523, 7590,
	7591, 7635, 7677,
	7510, 7511, 7417,
	7509
}
tCHUNMINGMENBUFF = {7849, 7383, 7396, 7898, 7941, 7876, 7877, 7878}
tYANMENGUANZHIYI = {8214, 8243, 8258, 8259, 8260, 8261, 8308, 8314, 8322, 8331, 8332, 8333, 8334, 8336, 8361, 8368, 8369, 8370, 8371, 8378, 8525, 8480, 8479}
tDUSHENDIAN = {3523}
tBuffTYXia_20170509 = {8542, 7992, 7993, 7994, 7995, 7996, 8008, 8009, 8023,
	8024, 8025, 8026, 8027, 8030, 8035, 8060, 8088, 8092, 8170,
	8172, 8174, 8175, 8179, 8182, 8183, 8184, 8185, 8187, 8188, 8195,
	8196, 8198, 8199, 8200, 8201, 8202, 8203, 8205, 8822, 8823, --����Ϊ����
	8039, 8040, 8042, 8044, 8045, 8046, 8047, 8048, 8049, 8206, 8239, 8240, 8241, 8465, --����Ϊ����
}
tTIANQILIN = {8734, 8736, 8764, 8776, 8781}
tHUISHANSHUYUAN = {8752}
tBuff_DATA20170509 = {
	8901,
	8902,
	8903,
	8904,
	8905,

	8906,
	8907,
	8908,
	8909,
	8910,

	8934,

	8935,

	8948,

	8912,

	8967,

	9160,
	9029,

	9177,
	9178,
}
tDahuandanMapList = {
	[41] = true, -- Ӣ�����ε�
	[36] = true, -- Ӣ�����������
	[37] = true, -- Ӣ���칤��
	[43] = true, -- Ӣ�ۿ����
	[45] = true, -- Ӣ������Ͽ
	[34] = true, -- ���굾���
	[47] = true, -- Ӣ�۷��굾���
	[26] = true, -- ݶ����ǰɽ
	[40] = true, -- Ӣ��ݶ����ǰɽ
	[28] = true, -- ����ɽ��
	[44] = true, -- Ӣ������ɽ��
	[33] = true, -- ���ӷ�
	[42] = true, -- Ӣ�����ӷ�
}
tItemFengxueDXC = {21468, 21864, 21897}
tBuffFengxueDXC = {
	7363, 7368, 7377,
	7375, 7370, 7363,
	7376, 7438, 7411,
	7412, 7445, 7441,
	7520, 7695, 7694,
	7415, 7413, 7450,
	7693, 7495, 7447,
	7446, 7452, 7443,
	6681, 6682, 6683,
	6684, 6685, 6686,
	6687, 6688, 6641,
	6650, 6653, 6655,
	6656, 6661, 6666,
	6662, 6664, 6665,
	7299, 7298, 7284,
	7285, 7286, 7287,
	7295, 7296, 7297,
	7662, 7663, 7664,
	7665, 7666, 7697,
	7757
}
tBuffTYShang = {7942, 7945, 8032, 8346, 8392, 8679, --�����ݳ�
}
tYINSHANSHENGQUAN = {8828, 8833, 8834, 8836, 8848, 9024, 8881}
tBAIDISHUIGONG = {10765, 10774, 10790, 10702, 10703, 10767, 10772, 10773, 10777, 10778, 10780, 10782, 10784, 10785, 10787, 10788, 10789, 10797, 10798, 10799, 10803, 10812, 10853, 10927, 10928, 10929}
tHUAYUEBIEYUAN = {8885, 8895, 8896, 8897, 8915, 8916, 8917, 8918, 8968, 8969, 8970, 8974, 8975, 8976, 8977, 8978, 8979, 8980, 8981, 8982, 8983, 8985, 8986, 9018, 9019, 9126, 9647, 9648, 9649, 9650, 9651, 9652, 9653, 9654, 9655, 9656, 9657, 9658, 9659, 9660, 9661, 9662, 9663, 9664, 9665, 9681, 9682, 9684, 9685, 9687, 9690, 10037, 10038, 10039, 9387}
tXIANLVTINGYUAN = {9195, 9291, 9193, 9189, 9562, 9347, 9305, 9304, 9192, 10238}
tGUANFENGDIAN = {10545, 10546, 10547, 10548, 10549, 10550, 10551, 10552, 10553, 10554, 10557, 10560, 10562, 10566, 10570, 10571, 10572, 10573, 10575, 10577, 10596, 10597, 10598, 10599, 10600, 10616, 10629, 10630, 10631, 10632, 10633, 10634, 10635, 10636, 10637, 10638, 10639, 10640, 10641, 10642, 10643, 10644, 10645, 10646, 10647, 10648, 10649, 10650, 10651, 10652, 10653, 10654, 10655, 10656, 10657, 10664, 10665, 10668, 10674, 10675, 10677, 10678, 10690, 10691, 10692, 10696, 10698, 10699, 10700, 10711, 10712, 10713, 10715, 10716, 10717, 10718, 10727, 10728, 10729, 10761, 10762, 10763, 10769, 10770, 10771, 10781, 10783, 10786, 10804, 10805, 10806, 10813, 10820, 10843, 10858, 10859, 10875, 10908, 10911, 10912, 10913, 10914, 10933, 10935, 10940, 10949, 10950, 10955, 10956, 10963, 10985, 10986, 10987, 10988, 10989, 10990, 10991, 10992, 10993, 10994, 10995, 10996, 10997, 10998, 10999, 11000, 11002, 11010, 11024, 11027, 11029, 11030, 11034, 11041, 11042, 11043, 11072, 11073, 11074, 11075, 11076, 11131,
10552, 10557, 10560, 10562, 10566, 10570, 10571, 11119, 11122, 10769, 10813, 10771, 10770, 11124, 11260, 11114, 11371}
tSHUANGYAOTING = {10582, 10583, 10584, 10585, 10586, 10592, 10604, 10866, 10867, 10870, 10871, 10873, 10874, 10876, 10877, 10878, 10880, 10881, 10882, 10883, 10884, 10885, 10886, 10887, 10888, 10889, 10890, 10891, 10892, 10893, 10894, 10895, 10896, 10897, 10898, 10899, 10900, 10901, 10902, 10903, 10904, 10905, 10906, 10920, 10923, 11003, 11049, 11050, 11051, 11052, 11053, 11054, 11055, 11056, 11057, 11058, 11059, 11060, 11061, 11062, 11063, 11064, 11065, 11066, 11067, 11068, 11069, 11070, 11071, 11142, 11325, 11307, 11215, 11217, 11230}
tQIANLEIDIAN = {11612, 11632, 11633, 11553, 11554, 11555, 11556, 11557, 11562, 11568, 11570, 11571, 11572, 11576, 11577, 11578, 11581, 11699, 11702, 11703, 11935, 11949, 11804, 11784}
tDUANDAOTING = {11657, 11658, 11661, 11662, 11569, 11573, 11725, 11741, 11742, 11743, 11744, 11748, 11749, 11752, 11753, 11758, 11763, 11767, 11768, 11771, 11781, 11790, 11841}
tDAOLUNHAITING = {11791, 11849, 11853}

-- ��Щ����û������Ҫ������
tItemNanZhaoHuangGong = {17498, 18071, 18072, 17790, 17791, 17972, 17707, 17705, 17706, 17547, 16685, 17508, 17509, 17507}
tItemDaMingGong = {18644, 18645, 18646, 18875, 19340, 19341, 19342, 19343, 19344, 19391, 19392, 19393, 19394, 19395, 19396}
tItemXueZhanTianCe = {20570, 20778, 20779, 20771, 20772, 20773, 20784, 20785, 20763}
tItemZhanBaoJunXieKu = {18733, 18734, 18735}
tItemQinHuangLing = {21090, 21092, 21094}
tBuffQinHuangLing = {7476, 7479, 7480, 7481, 7482, 7483, 7485, 7486, 7487, 7460, 7461, 7488, 7470, 7472, 7779, 7781, 7748, 7576}
tItemQunMingMen = {21090, 21092, 21094}
tItemTianQiLin = {23024}
tItemYanMenGuanZhiYi = {21090, 21092, 21094}
tItemZhanBaoJiaLan = {22078}
tItemYinShanShengQuan = {23260}
tItemBaiDiShuiGong = {26731}
tItemGuanFengDian = {26574, 26719}
tItemShuangYaoTing = {26719}
tItemQianLeiDian = {27901}
tItemDuanDaoTing = {27901, 28175}
tBuffZhanBaoJunXieKu = {5900, 4934}

function OnEnterSceneCommon_Dungeon0(player, scene)
	if not scene then
		scene = player.GetScene()		
	end
	local nStartIndex = BeginTimeStat()
	-- ���Ŀ�ʼ

	-- �����Ժ�ɾ�BUFFɾ��
	if scene.dwMapID ~= 209 then
		if player.IsHaveBuff(8860, 1) then
			player.DelBuff(8860, 1)
		end
		if player.IsHaveBuff(8861, 1) then
			player.DelGroupBuff(8861, 1)
		end
	end

	-- �����������м�ʱ������
	RemoteCallToClient(player.dwID, "On_Recharge_CloseSpeedRankPanel")
	if tFBTimeRankData.tCustomRankType[scene.dwMapID] and tFBTimeRankData.tCustomRankType[scene.dwMapID].bUpdate then
		RemoteCallToClient(player.dwID, "On_Recharge_CloseFBTimeRank")
		tFBTimeRankData.OpenFBTimer(player)
	else
		RemoteCallToClient(player.dwID, "On_Recharge_CloseFBTimeRank")
		player.DelBuff(8852, 1)
	end

	-- ɾ����ֱ���ŵ�����BUFF
	if player.IsHaveBuff(6928, 1) then
		player.DelBuff(6928, 1)
	end
	-- ɾ���������������ϳ��еĴ���������

	for v = 1, #tItem_DMG do
		local bItemAmount = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, tItem_DMG[v])
		if bItemAmount >= 1 then
			player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, tItem_DMG[v], 1)
		end
	end

	-- �޸�����Х�绢����
	for _, v in pairs(tDun_BuffList) do
		if player.IsHaveBuff(v[1], v[2]) then
			player.DelBuff(v[1], v[2])
		end
	end

	for i = 1, #tBuffDongTaiZhenFa do
		for j = 1, 6 do
			local buff_dongtai = player.IsHaveBuff(tBuffDongTaiZhenFa[i], j)
			if buff_dongtai then
				player.DelBuff(tBuffDongTaiZhenFa[i], j)
			end
		end
	end

	for v = 1, #tItem_dongtai do
		local bItemAmount = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, tItem_dongtai[v])
		if bItemAmount >= 1 then
			player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, tItem_dongtai[v], 1)
		end
	end

	for i = 1, #tItem_nanzhao do
		local bItemAmount = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, tItem_nanzhao[i])
		if bItemAmount >= 1 then
			if scene.dwMapID ~= 155 then
				player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, tItem_nanzhao[i], 1)
			end
		end
	end

	--ɾ����ս���ű��׺���BUFF����������
	if scene.dwMapID ~= 136 and scene.dwMapID ~= 138 then
		local buff = player.IsHaveBuff(3783, 1)
		if buff then
			player.DelBuff(3783, 1)
		end
		
		local buff2 = player.IsHaveBuff(3824, 1)
		if buff2 then
			player.DelBuff(3824, 1)
		end
		
		local buff3 = player.IsHaveBuff(3808, 1)
		if buff3 then
			player.DelGroupBuff(3808, 1)
		end

		local nNumber = player.GetItemAmount(5, 11821)
		if nNumber ~= 0 then
			player.CostItem(5, 11821, nNumber)
		end

		local nNumber = player.GetItemAmount(5, 11820)
		if nNumber ~= 0 then
			player.CostItem(5, 11820, nNumber)
		end

		local nNumber = player.GetItemAmount(5, 11819)
		if nNumber ~= 0 then
			player.CostItem(5, 11819, nNumber)
		end
	end

	--�ֹ�����¼���BUFF�ͳ�������ɾ��
	if scene.dwMapID ~= 131 and scene.dwMapID ~= 148 then
		for i = 1, 3 do
			local buff = player.IsHaveBuff(1888 + i, 3)
			if buff then
				player.DelGroupBuff(1888 + i, 3)
			end
			local buff2 = player.IsHaveBuff(1888 + i, 4)
			if buff2 then
				player.DelGroupBuff(1888 + i, 4)
			end
		end
		local buff3 = player.IsHaveBuff(1892, 1)
		if buff3 then
			player.DelBuff(1892, 1)
		end
		
		local nNumber = player.GetItemAmountInAllPackages(5, 16973)
		if nNumber ~= 0 then
			player.CostItemInAllPackage(5, 16973, nNumber)
		end

		local nNumber = player.GetItemAmountInAllPackages(5, 16998)
		if nNumber ~= 0 then
			player.CostItemInAllPackage(5, 16998, nNumber)
		end

		local nNumber = player.GetItemAmountInAllPackages(5, 16968)
		if nNumber ~= 0 then
			player.CostItemInAllPackage(5, 16968, nNumber)
		end

		local nNumber = player.GetItemAmountInAllPackages(5, 16999)
		if nNumber ~= 0 then
			player.CostItemInAllPackage(5, 16999, nNumber)
		end

		if player and player.IsHaveBuff(4071, 1) then
			player.DelBuff(4071, 1)
		end
		if player and player.IsHaveBuff(4072, 1) then
			player.DelBuff(4072, 1)
		end
		if player and player.IsHaveBuff(4073, 1) then
			player.DelBuff(4073, 1)
		end
		if player and player.IsHaveBuff(4074, 1) then
			player.DelBuff(4074, 1)
		end
		if player and player.IsHaveBuff(4075, 1) then
			player.DelBuff(4075, 1)
		end
		if player and player.IsHaveBuff(4076, 1) then
			player.DelBuff(4076, 1)
		end 
	end

	-- ���ﴦ���������ĳ�������ݶ����ǰɽ(26)��ɾ������[���صľ���]
	if player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 5625) > 0 and scene.dwMapID ~= 26 then
		player.CostItem(ITEM_TABLE_TYPE.OTHER, 5625, 1)
		player.SendSystemMessage(GLOBAL_STRING_TABLE.DEL_MYTHSCROLL)
	end
	if scene.dwMapID ~= 46 then
		tItemNumDHG[1] = {player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 6018), 6018}
		tItemNumDHG[2] = {player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 6019), 6019}
		tItemNumDHG[3] = {player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 6226), 6226}
		tItemNumDHG[4] = {player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 6227), 6227}
		tItemNumDHG[5] = {player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 6228), 6228}
		tItemNumDHG[6] = {player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 6229), 6229}
		for i = 1, #tItemNumDHG do
			if tItemNumDHG[i][1] > 0 then
				player.CostItem(ITEM_TABLE_TYPE.OTHER, tItemNumDHG[i][2], tItemNumDHG[i][1])
			end
		end
		local Buff = player.GetBuff(2142, 0)
		if Buff then
			player.DelGroupBuff(2142, Buff.nLevel)
		end
	end
	--�����������������ҽ���ĳ�����������Χ����55����ɾ������[��������][ţ�ǹ�]
	local ItemAmount6287 = player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 6287)
	local ItemAmount6290 = player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 6290)
	if ItemAmount6287 > 0 and scene.dwMapID ~= 55 then
		player.CostItem(ITEM_TABLE_TYPE.OTHER, 6287, ItemAmount6287)
	end

	if ItemAmount6290 > 0 and scene.dwMapID ~= 55 then
		player.CostItem(ITEM_TABLE_TYPE.OTHER, 6290, ItemAmount6290)
	end

	--�����������������ҽ���ĳ�����������ƺ��53����ɾ������[����][ժ�ǹ�]
	local ItemAmount6663 = player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 6663)
	local ItemAmount6664 = player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 6664)
	if ItemAmount6663 > 0 and scene.dwMapID ~= 53 then
		player.CostItem(ITEM_TABLE_TYPE.OTHER, 6663, ItemAmount6663)
	end

	if ItemAmount6664 > 0 and scene.dwMapID ~= 53 then
		player.CostItem(ITEM_TABLE_TYPE.OTHER, 6664, ItemAmount6664)
	end
	--������������BUFF

	if scene.dwMapID ~= 133 and scene.dwMapID ~= 134 then
		for i = 1, #tZHULONGBUFF do
			if player.IsHaveBuff(tZHULONGBUFF[i], 1) then
				player.DelBuff(tZHULONGBUFF[i], 1)
			end

			if player.IsHaveBuff(tZHULONGBUFF[i], 2) then
				player.DelBuff(tZHULONGBUFF[i], 2)
			end
		end

		if player.IsHaveBuff(2587, 3) then
			player.DelBuff(2587, 3)
		end
	end
	--�����������������ҽ���ĳ���������گ�ʹ���140����Ӣ����گ�ʹ���155���ĵ��ߴ���

	if scene.dwMapID ~= 140 and scene.dwMapID ~= 155 then
		for i = 1, #tItemNanZhaoHuangGong do
			local nItemNZHG = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, tItemNanZhaoHuangGong[i])
			if nItemNZHG ~= 0 then
				player.CostItem(ITEM_TABLE_TYPE.OTHER, tItemNanZhaoHuangGong[i], nItemNZHG)
			end
		end
		if player.IsHaveBuff(4934, 1) then			--������
			player.DelBuff(4934, 1)
		end
	end
	--�����������������ҽ���ĳ������Ǵ�������164����Ӣ�۴�������165����buff����͵��ߴ���
	if scene.dwMapID ~= 164 and scene.dwMapID ~= 165 then
		for i = 1, #tDAMINGGONGBUFF do
			if player.IsHaveBuff(tDAMINGGONGBUFF[i], 1) then
				player.DelGroupBuff(tDAMINGGONGBUFF[i], 1)
			end

			if player.IsHaveBuff(tDAMINGGONGBUFF[i], 2) then
				player.DelGroupBuff(tDAMINGGONGBUFF[i], 2)
			end
		end

		if player.IsHaveBuff(2587, 3) then
			player.DelBuff(2587, 3)
		end

		if player.IsHaveBuff(5597, 3) then
			player.DelBuff(5597, 3)
		end

		for i = 1, #tItemDaMingGong do
			local nItemDMG = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, tItemDaMingGong[i])
			if nItemDMG ~= 0 then
				player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, tItemDaMingGong[i], nItemDMG)
			end
		end
	end
	--�����������������ҽ���ĳ�������ս����е�⣨160����Ӣ��ս����е���buff����͵��ߴ���

	if scene.dwMapID ~= 160 and scene.dwMapID ~= 171 then
		for i = 1, #tItemZhanBaoJunXieKu do
			local nItemZBJXK = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, tItemZhanBaoJunXieKu[i])
			if nItemZBJXK ~= 0 then
				player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, tItemZhanBaoJunXieKu[i], nItemZBJXK)
			end
		end

		for i = 1, #tBuffZhanBaoJunXieKu do
			if player.IsHaveBuff(tBuffZhanBaoJunXieKu[i], 1) then
				player.DelBuff(tBuffZhanBaoJunXieKu[i], 1)
			end
			if player.IsHaveBuff(tBuffZhanBaoJunXieKu[i], 2) then
				player.DelBuff(tBuffZhanBaoJunXieKu[i], 2)
			end
			if player.IsHaveBuff(5439, 1) then
				player.DelGroupBuff(5439, 1)
			end
			if player.IsHaveBuff(5439, 2) then
				player.DelGroupBuff(5439, 2)
			end
		end
	end
	--�����������������ҽ���ĳ�������Ѫս��ߣ�175����Ӣ��Ѫս��ߣ�176����buff����͵��ߴ���

	if scene.dwMapID ~= 175 and scene.dwMapID ~= 176 then
		for i = 1, #tItemXueZhanTianCe do
			local nItemXZTC = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, tItemXueZhanTianCe[i])
			if nItemXZTC ~= 0 then
				player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, tItemXueZhanTianCe[i], nItemXZTC)
			end
		end

		for i = 1, #tXUEZHANTIANCEBUFF do
			if player.IsHaveBuff(tXUEZHANTIANCEBUFF[i], 1) then
				player.DelGroupBuff(tXUEZHANTIANCEBUFF[i], 1)
			end

			if player.IsHaveBuff(tXUEZHANTIANCEBUFF[i], 2) then
				player.DelGroupBuff(tXUEZHANTIANCEBUFF[i], 2)
			end
		end
	end
	--�����������������ҽ���ĳ��������ػ��꣨182����Ӣ���ػ��꣨183����buff����͵��ߴ���

	if scene.dwMapID ~= 182 and scene.dwMapID ~= 183 then
		for i = 1, #tItemQinHuangLing do
			local nItemQHL = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, tItemQinHuangLing[i])
			if nItemQHL ~= 0 then
				player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, tItemQinHuangLing[i], nItemQHL)
			end
		end
		for i = 1, #tBuffQinHuangLing do
			local buff_qhl = player.IsHaveBuff(tBuffQinHuangLing[i], 1)
			if buff_qhl then
				player.DelGroupBuff(tBuffQinHuangLing[i], 1)
			end
			local buff_yxqhl = player.IsHaveBuff(tBuffQinHuangLing[i], 2)
			if buff_yxqhl then
				player.DelGroupBuff(tBuffQinHuangLing[i], 2)
			end
		end

		for i = 1, #tQINHUANGLINGBUFF do
			if player.IsHaveBuff(tQINHUANGLINGBUFF[i], 1) then
				player.DelGroupBuff(tQINHUANGLINGBUFF[i], 1)
			end

			if player.IsHaveBuff(tQINHUANGLINGBUFF[i], 2) then
				player.DelGroupBuff(tQINHUANGLINGBUFF[i], 2)
			end
		end

		if player.IsHaveBuff(2587, 3) then
			player.DelBuff(2587, 3)
		end
	end
	--�����������������ҽ���ĳ������Ǵ�����(187)��buff����͵��ߴ���

	if scene.dwMapID ~= 187 then
		for i = 1, #tItemQunMingMen do
			local nItemQMM = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, tItemQunMingMen[i])
			if nItemQMM ~= 0 then
				player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, tItemQunMingMen[i], nItemQMM)
			end
		end
	end

	for i = 1, #tCHUNMINGMENBUFF do
		if player.IsHaveBuff(tCHUNMINGMENBUFF[i], 1) then
			if scene.dwMapID ~= 187 then
				player.DelGroupBuff(tCHUNMINGMENBUFF[i], 1)
			else
				local npccqy = scene.GetNpcByNickName("CuiQianYou")
				if not npccqy or (npccqy and npccqy.bFightState) then
					player.DelGroupBuff(7898, 1)
				end
			end
		end

		if player.IsHaveBuff(tCHUNMINGMENBUFF[i], 2) then
			if scene.dwMapID ~= 187 then
				player.DelGroupBuff(tCHUNMINGMENBUFF[i], 2)
			end
		end
	end

	--�����������������ҽ���ĳ����������Ź�֮��(196)��Ӣ�����Ź�֮��(195)��buff����͵��ߴ���

	if scene.dwMapID ~= 195 and scene.dwMapID ~= 196 then
		for i = 1, #tItemYanMenGuanZhiYi do
			local nItemYMGZY = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, tItemYanMenGuanZhiYi[i])
			if nItemYMGZY ~= 0 then
				player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, tItemYanMenGuanZhiYi[i], nItemYMGZY)
			end
		end

		for i = 1, #tYANMENGUANZHIYI do
			if player.IsHaveBuff(tYANMENGUANZHIYI[i], 1) then
				player.DelGroupBuff(tYANMENGUANZHIYI[i], 1)
			end

			if player.IsHaveBuff(tYANMENGUANZHIYI[i], 2) then
				player.DelGroupBuff(tYANMENGUANZHIYI[i], 2)
			end
		end
	end
	--�����������������ҽ���ĳ������Ƕ����(75)��Ӣ�۶����(112)��buff����
	if scene.dwMapID ~= 75 and scene.dwMapID ~= 112 then
		for i = 1, #tDUSHENDIAN do
			if player.IsHaveBuff(tDUSHENDIAN[i], 1) then
				player.DelGroupBuff(tDUSHENDIAN[i], 1)
			end

			if player.IsHaveBuff(tDUSHENDIAN[i], 2) then
				player.DelGroupBuff(tDUSHENDIAN[i], 2)
			end
		end
	end

	--���ǹ��������ż�ɾ��DEBUFF
	if scene.dwMapID ~= 61 then
		player.DelBuff(1951, 1)
		player.DelBuff(1991, 1)
	end
	-- ����ս������ɾ���桤ϵ��BUFF
	if scene.dwMapID ~= 32 then
		local Buff = player.GetBuff(2143, 0)
		if Buff then
			player.DelGroupBuff(2143, Buff.nLevel)
		end
	end

	--����������������ҽ���ĳ�������Ӣ��ս������(46)����ͨս��(32)��ɾ��DEBUFF�������ֻ��䡿,��׷����
	if scene.dwMapID ~= 46 and scene.dwMapID ~= 32 then
		if player.IsHaveBuff(2134, 1) or player.IsHaveBuff(2133, 1) or player.IsHaveBuff(2131, 2) or player.IsHaveBuff(2131, 1) then
			player.DelGroupBuff(2134, 1)
			player.DelGroupBuff(2133, 1)
			player.DelGroupBuff(2131, 1)
			player.DelGroupBuff(2131, 2)
		end

		for i = 1, #tItemZhanBaoJiaLan do
			local nItemZBJL = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, tItemZhanBaoJiaLan[i])
			if nItemZBJL ~= 0 then
				player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, tItemZhanBaoJiaLan[i], nItemZBJL)
			end
		end
	end

	--�뿪�ֹ�����ɾ����װbuff
	if scene.dwMapID ~= 60 or scene.dwMapID ~= 65 or scene.dwMapID ~= 66 then
		local nNum = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, 7031)
		if nNum > 0 then
			player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, 7031, nNum)
		end
	end

	--�뿪ī���ص�buff
	if scene.dwMapID ~= 184 then
		if player.IsHaveBuff(7793, 1) then
			player.DelBuff(7793, 1)
		end

		if player.IsHaveBuff(7792, 1) then
			player.DelBuff(7792, 1)
		end
	end

	--Ӣ�۽�ڣDEBUFF����
	tBuffList = {
		[1] = {dwBuffID = 2060, tBuffLevel = {1, 2, 3, 4}}, --�����Ȼ
		[2] = {dwBuffID = 2061, tBuffLevel = {1, 2, 3, 4}}, --��������
		[3] = {dwBuffID = 2084, tBuffLevel = {1, 2, 3, 4}}, --�����Ҷ
		[4] = {dwBuffID = 2085, tBuffLevel = {1, 2, 3, 4}}, --����̹�
		[5] = {dwBuffID = 2092, tBuffLevel = {1}}, --�Ϻ�
		[6] = {dwBuffID = 2093, tBuffLevel = {1}}, --���ٱ���
		[7] = {dwBuffID = 2094, tBuffLevel = {1}}, --��ɫ����
		[8] = {dwBuffID = 2095, tBuffLevel = {1}}, --��ɫ����
		[9] = {dwBuffID = 2096, tBuffLevel = {1}}, --��ɫ����
		[10] = {dwBuffID = 2068, tBuffLevel = {1}}, --��ɫ����
		[11] = {dwBuffID = 2097, tBuffLevel = {1}}, --�������
		[12] = {dwBuffID = 2124, tBuffLevel = {1}}, --��������
		[13] = {dwBuffID = 2106, tBuffLevel = {1}}, --����
		[14] = {dwBuffID = 2087, tBuffLevel = {1}}, --�����Ȼ������BUFF��
		[15] = {dwBuffID = 2088, tBuffLevel = {1}}, --�������ף�����BUFF��
		[16] = {dwBuffID = 2089, tBuffLevel = {1}}, --�����Ҷ������BUFF��
		[17] = {dwBuffID = 2090, tBuffLevel = {1}}, --�����ݽ�
		[18] = {dwBuffID = 2091, tBuffLevel = {1}}, --����̹ǣ�����BUFF��
	}

	if scene.dwMapID ~= 62 then
		for i = 1, #tBuffList do
			for j = 1, #tBuffList[i].tBuffLevel do
				if player.IsHaveBuff(tBuffList[i].dwBuffID, tBuffList[i].tBuffLevel[j]) then
					player.DelGroupBuff(tBuffList[i].dwBuffID, tBuffList[i].tBuffLevel[j])
					break
				end
			end
		end
	end

	-- 貴亣������Ч��BUFF
	if scene.dwMapID ~= 200 and scene.dwMapID ~= 222 then
		for i = 1, #tBuff_DATA20170509 do
			local buffnow = player.GetBuff(tBuff_DATA20170509[i], 0)
			if buffnow then
				player.DelGroupBuff(tBuff_DATA20170509[i], buffnow.nLevel)
			end
		end
	end

	-- ���������ߴ���
	if scene.dwMapID ~= 110 or scene.dwMapID ~= 113 then
		local nNum = player.GetItemAmount(5, 8797)
		if nNum > 0 then
			player.CostItem(5, 8797, nNum)
		end
	end

	-- ���������ߴ���
	if scene.dwMapID ~= 107 or scene.dwMapID ~= 114 then
		local nNum = player.GetItemAmount(5, 7633)
		if nNum > 0 then
			player.CostItem(5, 7633, nNum)
		end
	end
	-- ���ﴦ���������ĳ�������������ɵ�Ӣ�۸������Ĵ󸱱����Ĵ�Ӣ�۸�����ɾ��������ϵ�[��Ϫ�󻹵�][1658]BUFF

	if player.IsHaveBuff(1658, 0) and not tDahuandanMapList[scene.dwMapID] then
		player.DelBuff(1658, (player.GetBuff(1658, 0)).nLevel)
	end
	--�����������������ҽ���ĳ������Ƿ�ѩ����壨177����Ӣ�۷�ѩ����壨178����buff����͵��ߴ���

	if scene.dwMapID ~= 177 and scene.dwMapID ~= 178 then
		for i = 1, #tItemFengxueDXC do
			local nItemFXDXC = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, tItemFengxueDXC[i])
			if nItemFXDXC ~= 0 then
				player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, tItemFengxueDXC[i], nItemFXDXC)
			end
		end
		for i = 1, #tBuffFengxueDXC do
			local buffFXDXC = player.IsHaveBuff(tBuffFengxueDXC[i], 1)
			if buffFXDXC then
				player.DelGroupBuff(tBuffFengxueDXC[i], 1)
			end
			--Ӣ��
			local buffYXFXDXC = player.IsHaveBuff(tBuffFengxueDXC[i], 2)
			if buffYXFXDXC then
				player.DelGroupBuff(tBuffFengxueDXC[i], 2)
			end
		end
	end

	--�����������������ҽ���ĳ�������̫ԭ֮սҹ�ع³ǣ�191����Ӣ��̫ԭ֮սҹ�ع³ǣ�198������ս̫ԭ֮սҹ�ع³ǣ�205����10����ս̫ԭ֮սҹ�ع³ǣ�211����buff����͵��ߴ���

	if scene.dwMapID ~= 191 and scene.dwMapID ~= 198 and scene.dwMapID ~= 205 and scene.dwMapID ~= 211 then
		for i = 1, #tBuffTYShang do
			local buff_TYS = player.GetBuff(tBuffTYShang[i], 0)
			if buff_TYS then
				player.DelGroupBuff(tBuffTYShang[i], buff_TYS.nLevel)
			end
		end

		local ItemAmount22221 = player.GetItemAmount(ITEM_TABLE_TYPE.OTHER, 22221)
		if ItemAmount22221 > 0 then
			player.CostItem(ITEM_TABLE_TYPE.OTHER, 22221, ItemAmount22221)
		end
	end

	--�����������������ҽ���ĳ�������̫ԭ�����ǣ�192����Ӣ��̫ԭ�����ǣ�199������ս̫ԭ�����ǣ�206����10����ս̫ԭ�����ǣ�212����buff����͵��ߴ���

	if scene.dwMapID ~= 192 and scene.dwMapID ~= 199 and scene.dwMapID ~= 206 and scene.dwMapID ~= 212 then
		for i = 1, #tBuffTYXia_20170509 do
			local buff_TYX = player.GetBuff(tBuffTYXia_20170509[i], 0)
			if buff_TYX then
				player.DelGroupBuff(tBuffTYXia_20170509[i], buff_TYX.nLevel)
			end
		end
	end

	--�����������������ҽ���ĳ�������̫ԭ֮սҹ�ع³ǣ�191����Ӣ��̫ԭ֮սҹ�ع³ǣ�198����̫ԭ�����ǣ�192����Ӣ��̫ԭ�����ǣ�199����buff����͵��ߴ���
	if scene.dwMapID ~= 191 and scene.dwMapID ~= 198 and scene.dwMapID ~= 192 and scene.dwMapID ~= 199 then
		local buff_TYPQB = player.GetBuff(8688, 0)   --̫ԭPQ��ǿ
		if buff_TYPQB then
			player.DelGroupBuff(8688, buff_TYPQB.nLevel)
		end
	end
--�����������������ҽ���ĳ�������������(203)��Ӣ��������(224)��buff����͵��ߴ���

	if scene.dwMapID ~= 203 and scene.dwMapID ~= 224 then
		for i = 1, #tItemTianQiLin do
			local nItemTQL = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, tItemTianQiLin[i])
			if nItemTQL ~= 0 then
				player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, tItemTianQiLin[i], nItemTQL)
			end
		end

		for i = 1, #tTIANQILIN do
			if player.IsHaveBuff(tTIANQILIN[i], 1) then
				player.DelGroupBuff(tTIANQILIN[i], 1)
			end

			if player.IsHaveBuff(tTIANQILIN[i], 2) then
				player.DelGroupBuff(tTIANQILIN[i], 2)
			end
		end
	end

	--�����������������ҽ���ĳ�������΢ɽ��Ժ(219)��Ӣ��΢ɽ��Ժ(--)��buff����͵��ߴ���
	if scene.dwMapID ~= 219 then
		for i = 1, #tHUISHANSHUYUAN do
			if player.IsHaveBuff(tHUISHANSHUYUAN[i], 1) then
				player.DelGroupBuff(tHUISHANSHUYUAN[i], 1)
			end

			if player.IsHaveBuff(tHUISHANSHUYUAN[i], 2) then
				player.DelGroupBuff(tHUISHANSHUYUAN[i], 2)
			end
		end
	end

	--�����������������ҽ���ĳ���������ɽʥȪ(204)��Ӣ����ɽʥȪ(227)��buff����͵��ߴ���

	if scene.dwMapID ~= 204 and scene.dwMapID ~= 227 then
		for i = 1, #tItemYinShanShengQuan do
			local nItemYSSQ = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, tItemYinShanShengQuan[i])
			if nItemYSSQ ~= 0 then
				player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, tItemYinShanShengQuan[i], nItemYSSQ)
			end
		end

		for i = 1, #tYINSHANSHENGQUAN do
			if player.IsHaveBuff(tYINSHANSHENGQUAN[i], 1) then
				player.DelGroupBuff(tYINSHANSHENGQUAN[i], 1)
			end

			if player.IsHaveBuff(tYINSHANSHENGQUAN[i], 2) then
				player.DelGroupBuff(tYINSHANSHENGQUAN[i], 2)
			end
		end
	end

	--�����������������ҽ���ĳ������ǰ׵�ˮ��(242)����ս�׵�ˮ��(227)��buff����͵��ߴ���

	if scene.dwMapID ~= 242 and scene.dwMapID ~= 244 then
		for i = 1, #tItemBaiDiShuiGong do
			local nItemBDSG = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, tItemBaiDiShuiGong[i])
			if nItemBDSG ~= 0 then
				player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, tItemBaiDiShuiGong[i], nItemBDSG)
			end
		end

		for i = 1, #tBAIDISHUIGONG do
			if player.IsHaveBuff(tBAIDISHUIGONG[i], 1) then
				player.DelGroupBuff(tBAIDISHUIGONG[i], 1)
			end

			if player.IsHaveBuff(tBAIDISHUIGONG[i], 2) then
				player.DelGroupBuff(tBAIDISHUIGONG[i], 2)
			end
		end
	end
	--�����������������ҽ���ĳ������������й�_���±�Ժ(221)��Ӣ�������й�_���±�Ժ(230)��10����ս�����й�_���±�Ժ(221)��25��ս�����й�_���±�Ժ(221)�Ͱ�������й�_���±�Ժ(233)��buff����͵��ߴ���
	--local ItemHuaYueBieYuan = {23260}
	--if scene.dwMapID ~= 221 and scene.dwMapID ~= 230 and scene.dwMapID ~= 233 and scene.dwMapID ~= 221 and scene.dwMapID ~= 221 then
	--for i = 1, #ItemHuaYueBieYuan do
	--local nItemHYBY = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, ItemHuaYueBieYuan[i])
	--if nItemHYBY ~= 0 then
	--player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, ItemHuaYueBieYuan[i], nItemHYBY)
	--end
	--end
	--end
	if scene.dwMapID ~= 221 and scene.dwMapID ~= 230 and scene.dwMapID ~= 233 and scene.dwMapID ~= 235 and scene.dwMapID ~= 237 then
		for i = 1, #tHUAYUEBIEYUAN do
			if player.IsHaveBuff(tHUAYUEBIEYUAN[i], 1) then
				player.DelGroupBuff(tHUAYUEBIEYUAN[i], 1)
			end

			if player.IsHaveBuff(tHUAYUEBIEYUAN[i], 2) then
				player.DelGroupBuff(tHUAYUEBIEYUAN[i], 2)
			end

			if player.IsHaveBuff(tHUAYUEBIEYUAN[i], 3) then
				player.DelGroupBuff(tHUAYUEBIEYUAN[i], 3)
			end

			if player.IsHaveBuff(tHUAYUEBIEYUAN[i], 4) then
				player.DelGroupBuff(tHUAYUEBIEYUAN[i], 4)
			end
		end
	end

	--�����������������ҽ���ĳ������������й�_����ͥ԰(220)��Ӣ�������й�_����ͥ԰(231)��10����ս�����й�_����ͥ԰(220)��25��ս�����й�_����ͥ԰(220)�Ͱ�������й�_����ͥ԰(232)��buff����͵��ߴ���
	if scene.dwMapID ~= 220 and scene.dwMapID ~= 231 and scene.dwMapID ~= 232 and scene.dwMapID ~= 234 and scene.dwMapID ~= 236 then
		for i = 1, #tXIANLVTINGYUAN do
			if player.IsHaveBuff(tXIANLVTINGYUAN[i], 1) then
				player.DelGroupBuff(tXIANLVTINGYUAN[i], 1)
			end

			if player.IsHaveBuff(tXIANLVTINGYUAN[i], 2) then
				player.DelGroupBuff(tXIANLVTINGYUAN[i], 2)
			end

			if player.IsHaveBuff(tXIANLVTINGYUAN[i], 3) then
				player.DelGroupBuff(tXIANLVTINGYUAN[i], 3)
			end

			if player.IsHaveBuff(tXIANLVTINGYUAN[i], 4) then
				player.DelGroupBuff(tXIANLVTINGYUAN[i], 4)
			end
		end
	end
	--�����������������ҽ���ĳ�������������_�۷��(240)��Ӣ��������_�۷��(248)�Ͱ��������_�۷��(250)��buff����͵��ߴ���

	if scene.dwMapID ~= 240 and scene.dwMapID ~= 248 and scene.dwMapID ~= 250 then
		for i = 1, #tItemGuanFengDian do
			local nItemGFD = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, tItemGuanFengDian[i])
			if nItemGFD ~= 0 then
				player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, tItemGuanFengDian[i], nItemGFD)
			end
		end

		for i = 1, #tGUANFENGDIAN do
			if player.IsHaveBuff(tGUANFENGDIAN[i], 1) then
				player.DelGroupBuff(tGUANFENGDIAN[i], 1)
			end

			if player.IsHaveBuff(tGUANFENGDIAN[i], 2) then
				player.DelGroupBuff(tGUANFENGDIAN[i], 2)
			end

			if player.IsHaveBuff(tGUANFENGDIAN[i], 3) then
				player.DelGroupBuff(tGUANFENGDIAN[i], 3)
			end

			if player.IsHaveBuff(tGUANFENGDIAN[i], 4) then
				player.DelGroupBuff(tGUANFENGDIAN[i], 4)
			end
		end
	end

	--�����������������ҽ���ĳ�������������_˫��ͤ(241)��Ӣ��������_˫��ͤ(249)�Ͱ��������_˫��ͤ(251)��buff����͵��ߴ���

	if scene.dwMapID ~= 241 and scene.dwMapID ~= 249 and scene.dwMapID ~= 251 then
		for i = 1, #tItemShuangYaoTing do
			local nItemSYT = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, tItemShuangYaoTing[i])
			if nItemSYT ~= 0 then
				player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, tItemShuangYaoTing[i], nItemSYT)
			end
		end

		for i = 1, #tSHUANGYAOTING do
			if player.IsHaveBuff(tSHUANGYAOTING[i], 1) then
				player.DelGroupBuff(tSHUANGYAOTING[i], 1)
			end

			if player.IsHaveBuff(tSHUANGYAOTING[i], 2) then
				player.DelGroupBuff(tSHUANGYAOTING[i], 2)
			end

			if player.IsHaveBuff(tSHUANGYAOTING[i], 3) then
				player.DelGroupBuff(tSHUANGYAOTING[i], 3)
			end

			if player.IsHaveBuff(tSHUANGYAOTING[i], 4) then
				player.DelGroupBuff(tSHUANGYAOTING[i], 4)
			end
		end
	end

	--�����������������ҽ���ĳ������Ƿ��׵���_ǧ�׵�(264)��Ӣ�۷��׵���_ǧ�׵�(270)�Ͱ����׵���_ǧ�׵�(272)��buff����͵��ߴ���

	if scene.dwMapID ~= 264 and scene.dwMapID ~= 270 and scene.dwMapID ~= 272 then
		player.SetIdentityVisiableID(0)
		RemoteCallToClient(player.dwID, "SceneSfx", "Delete", "WIZARD_VISIABLE_OPEN")
		RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "rlcmd", "leave camera Post render")

		for i = 1, #tItemQianLeiDian do
			local nItemQLD = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, tItemQianLeiDian[i])
			if nItemQLD ~= 0 then
				player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, tItemQianLeiDian[i], nItemQLD)
			end
		end

		for i = 1, #tQIANLEIDIAN do
			if player.IsHaveBuff(tQIANLEIDIAN[i], 1) then
				player.DelGroupBuff(tQIANLEIDIAN[i], 1)
			end

			if player.IsHaveBuff(tQIANLEIDIAN[i], 2) then
				player.DelGroupBuff(tQIANLEIDIAN[i], 2)
			end

			if player.IsHaveBuff(tQIANLEIDIAN[i], 3) then
				player.DelGroupBuff(tQIANLEIDIAN[i], 3)
			end

			if player.IsHaveBuff(tQIANLEIDIAN[i], 4) then
				player.DelGroupBuff(tQIANLEIDIAN[i], 4)
			end
		end
	end

	--�����������������ҽ���ĳ������Ƿ��׵���_�͵���(263)��Ӣ�۷��׵���_�͵���(271)�Ͱ����׵���_�͵���(273)��buff����͵��ߴ���

	if scene.dwMapID ~= 263 and scene.dwMapID ~= 271 and scene.dwMapID ~= 273 then
		for i = 1, #tItemDuanDaoTing do
			local nItemDDT = player.GetItemAmountInAllPackages(ITEM_TABLE_TYPE.OTHER, tItemDuanDaoTing)
			if nItemDDT ~= 0 then
				player.CostItemInAllPackage(ITEM_TABLE_TYPE.OTHER, tItemDuanDaoTing, nItemDDT)
			end
		end

		for i = 1, #tDUANDAOTING do
			if player.IsHaveBuff(tDUANDAOTING[i], 1) then
				player.DelGroupBuff(tDUANDAOTING[i], 1)
			end

			if player.IsHaveBuff(tDUANDAOTING[i], 2) then
				player.DelGroupBuff(tDUANDAOTING[i], 2)
			end

			if player.IsHaveBuff(tDUANDAOTING[i], 3) then
				player.DelGroupBuff(tDUANDAOTING[i], 3)
			end

			if player.IsHaveBuff(tDUANDAOTING[i], 4) then
				player.DelGroupBuff(tDUANDAOTING[i], 4)
			end
		end
	end

	--�����������������ҽ���ĳ�������Ӣ�۵��ֺ���(262)buff����͵��ߴ���
	if scene.dwMapID ~= 262 and scene.dwMapID ~= 275 then
		for i = 1, #tDAOLUNHAITING do
			if player.IsHaveBuff(tDAOLUNHAITING[i], 1) then
				player.DelGroupBuff(tDAOLUNHAITING[i], 1)
			end

			if player.IsHaveBuff(tDAOLUNHAITING[i], 2) then
				player.DelGroupBuff(tDAOLUNHAITING[i], 2)
			end
		end
	end

	--�����������������й�_����ͥ԰4����ҵ��ߺ���Ч�����������
	local Bowl = scene.GetNpcByNickName("Zijinbo")
	if not Bowl then
		player.DelBuff(9213, 1)
	end
	-- ������������
	tInstanceFinishedCount.EnterMap(player.dwID, scene.dwMapID)
	-- ���Ľ���
	OnEnterSceneCommon_CallNextFunc(player, scene)
	EndTimeStat(nStartIndex, ENTERSCENECOMMON_FUNC_TIME_LIMIT)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
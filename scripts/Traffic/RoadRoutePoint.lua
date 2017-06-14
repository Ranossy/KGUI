
tRoadRoutePoint = {
{NodeID = 3,    MapID = 1,	CityID = 1,	    Camp = 0,	TongID = 0,	 nX = 17222,  nY = 24486,	nZ = 1052545},  --�������վ
{NodeID = 7,    MapID = 7,	CityID = 7,	    Camp = 0,	TongID = 0,	 nX = 43563,  nY = 3855,    nZ = 1119171},  --��������������
{NodeID = 9,    MapID = 5,	CityID = 5,	    Camp = 0,	TongID = 0,	 nX = 7456,	  nY = 13673,	nZ = 1048919},  --������վ
{NodeID = 11,	MapID = 11,	CityID = 11,	Camp = 0,	TongID = 0,	 nX = 60340,  nY = 8951,    nZ = 1049599},  --��ߵ���������
{NodeID = 13,	MapID = 2,	CityID = 2,	    Camp = 0,	TongID = 0,	 nX = 85293,  nY = 72597,	nZ = 1169238},  --�򻨵���������
{NodeID = 15,	MapID = 13,	CityID = 13,	Camp = 0,	TongID = 0,	 nX = 63803,  nY = 63202,	nZ = 1050257},  --��ˮ��վ
--{NodeID = 18,	MapID = 6,	CityID = 518,	Camp = 0,	TongID = 0,	 nX = 79072,  nY = 57703,	nZ = 1048841},  --������ͷ,��Ϊ������ˮ���ʱ�ر�
{NodeID = 21,	MapID = 9,	CityID = 9,	    Camp = 0,	TongID = 0,	 nX = 19514,  nY = 32889,	nZ = 1057412},  --�����վ
{NodeID = 24,	MapID = 6,	CityID = 6,	    Camp = 0,	TongID = 0,	 nX = 63335,  nY = 46246,	nZ = 1053295},  --������վ
{NodeID = 36,	MapID = 15,	CityID = 15,    Camp = 0,	TongID = 0,	 nX = 40826,  nY = 92586,	nZ = 1061636},  --������վ
--{NodeID = 38,	MapID = 16,	CityID = 16,    Camp = 0,	TongID = 0,	 nX = 23080,  nY = 8801,    nZ = 1056979},  --����������ͷ
{NodeID = 41,	MapID = 8,	CityID = 8,	    Camp = 0,	TongID = 0,	 nX = 33810,  nY = 68520,	nZ = 1052062},  --������վ
{NodeID = 47,	MapID = 10,	CityID = 10,    Camp = 0,	TongID = 0,	 nX = 12359,  nY = 34035,	nZ = 1048812},  --�ܵ�����ͷ
{NodeID = 49,	MapID = 12,	CityID = 12,    Camp = 0,	TongID = 0,	 nX = 8121,	  nY = 37242,	nZ = 1082304},  --�㻪����վ
{NodeID = 57,	MapID = 6,	CityID = 57,    Camp = 0,	TongID = 0,	 nX = 87822,  nY = 13789,	nZ = 1049226},  --���ݿܵ���ͷ
{NodeID = 87,	MapID = 30,	CityID = 30,    Camp = 0,	TongID = 0,	 nX = 56233,  nY = 5239,    nZ = 1053151},  --����������վ
{NodeID = 91,	MapID = 22,	CityID = 22,    Camp = 0,	TongID = 0,	 nX = 89921,  nY = 72922,	nZ = 1121648},  --����ɽ������վ
{NodeID = 97,	MapID = 21,	CityID = 21,    Camp = 0,	TongID = 0,	 nX = 45033,  nY = 43782,	nZ = 1059520},  --������վ
{NodeID = 99,	MapID = 35,	CityID = 35,    Camp = 0,	TongID = 0,	 nX = 92662,  nY = 106312,  nZ = 1149952},  --����Ͽ��վ
{NodeID = 101,	MapID = 23,	CityID = 23,    Camp = 0,	TongID = 0,	 nX = 38299,  nY = 40379,	nZ = 1049642},  --���Ż�Į��վ
{NodeID = 105,	MapID = 25,	CityID = 25,    Camp = 1,	TongID = 0,	 nX = 35785,  nY = 46087,	nZ = 1086489},  --��������վ
{NodeID = 108,	MapID = 22,	CityID = 22,    Camp = 1,	TongID = 0,	 nX = 15102,  nY = 14635,	nZ = 1110380},  --����ɽ��������վ
{NodeID = 110,	MapID = 22,	CityID = 22,    Camp = 2,	TongID = 0,	 nX = 10834,  nY = 73066,	nZ = 1097834},  --����ɽ���˹���վ
{NodeID = 116,	MapID = 27,	CityID = 27,    Camp = 2,	TongID = 0,	 nX = 40292,  nY = 25121,	nZ = 1070940},  --���˹���վ
{NodeID = 117,	MapID = 30,	CityID = 30,    Camp = 1,	TongID = 0,	 nX = 91366,  nY = 42324,	nZ = 1133393},  --���غ�����Ӫ��
{NodeID = 119,	MapID = 30,	CityID = 30,    Camp = 2,	TongID = 0,	 nX = 23778,  nY = 50825,	nZ = 1117474},  --���ض��˹�Ӫ��
}

--tForceToNpcID = {[7] = 1080, [16] = 3825, [11] = 1953, [2] = 166, [5] = 2743}
tForceToNpcID = {[7] = 1080, [11] = 1953, [2] = 166, [5] = 2743}

function CreateTrafficGard(scene)
	local tCamptoNpcID = {[0] = 6396, [1] = 6394, [2] = 6395}
	for k, v in pairs(tRoadRoutePoint) do
		if v.MapID == scene.dwMapID then
			if tForceToNpcID[v.MapID] then
				local npc_Gard1 = scene.CreateNpc(tForceToNpcID[v.MapID], v.nX + 80, v.nY + 80, v.nZ, 0, -1)
				local npc_Gard2 = scene.CreateNpc(tForceToNpcID[v.MapID], v.nX + 80, v.nY - 80, v.nZ, 128, -1)
				if npc_Gard1 and npc_Gard2 then
					npc_Gard1.nReviveTime = 300
					npc_Gard2.nReviveTime = 300
				end
			else
				local npc_Gard1 = scene.CreateNpc(tCamptoNpcID[v.Camp], v.nX + 80, v.nY + 80, v.nZ, 0, -1)
				local npc_Gard2 = scene.CreateNpc(tCamptoNpcID[v.Camp], v.nX + 80, v.nY - 80, v.nZ, 128, -1)
				if npc_Gard1 and npc_Gard2 then
					npc_Gard1.nReviveTime = 300
					npc_Gard2.nReviveTime = 300
				end
			end
		end
	end
end

function CreateReviveGard(scene, tRevivePos)
	local tGardID = {[CAMP.EVIL] = 6395, [CAMP.GOOD] = 6394, [CAMP.NEUTRAL] = 6396
	}
	for k, v in pairs(tRevivePos) do
		if tForceToNpcID[scene.dwMapID] then
			local npc_Gard1 = scene.CreateNpc(tForceToNpcID[scene.dwMapID], v.X + 100, v.Y + 100, v.Z, 0, -1)
			local npc_Gard2 = scene.CreateNpc(tForceToNpcID[scene.dwMapID], v.X + 100, v.Y - 100, v.Z, 0, -1)
			if npc_Gard1 and npc_Gard2 then
				npc_Gard1.nReviveTime = 300
				npc_Gard2.nReviveTime = 300
			end
		else
			local npc_Gard1 = scene.CreateNpc(tGardID[v.Camp], v.X + 100, v.Y + 100, v.Z, v.Face, -1)
			local npc_Gard2 = scene.CreateNpc(tGardID[v.Camp], v.X + 100, v.Y - 100, v.Z, v.Face, -1)
			if npc_Gard1 and npc_Gard2 then
				npc_Gard1.nReviveTime = 300
				npc_Gard2.nReviveTime = 300
			end
		end
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
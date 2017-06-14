---------------------------------------------------------------------->
-- �ű�����:	scripts/Include/OnEnterSceneCommon/����ͼ�ű�_�������.lua
-- ����ʱ��:	2017/3/20 11:57:31
-- �����û�:	zhengfeng6
-- �ű�˵��:
----------------------------------------------------------------------<
--[[Include("scripts/Map/����ϵͳ/include/��������_data.lua")
Include("scripts/Map/��������/ƽ����Ը/include/ƽ����Ը_data.lh")
Include("scripts/Map/��������/��������/include/�����輧_data.lua")
Include("scripts/Map/��������/��������/include/Data.lua")
Include("scripts/Map/��������/���Ӳ���/include/���Ӳ���_data.lua")
Include("scripts/Map/��������/�����޹�/include/�����޹�_data.lua")
Include("scripts/Map/��������/÷��׮/include/÷��׮����.lua")
Include("scripts/Map/��������/include/��������_data.lua")
Include("scripts/Map/��������/������Ե����/include/׽����_data.lua")--����ͷ��
Include("scripts/Map/��������/������Ե����/include/���¸�_data.lua")--����ͷ��
Include("scripts/Map/��������/������Ե����/include/���־�_data.lua")--����ͷ��
Include("scripts/Map/��������/������Ե����/include/��ͯ��_data.lua")--����ͷ��
Include("scripts/Map/��������/������Ե����/include/����·_data.lua")--����ͷ��
Include("scripts/Map/��������/������Ե����/include/ʤ����_data.lua")--����ͷ��
Include("scripts/Map/��������/������Ե����/include/������_data.lua")--����ͷ��
Include("scripts/Map/��������/include/�������_data.lua")
Include("scripts/Map/��������/�����Ե/include/�����Ե_Data.lua")
Include("scripts/Map/��������/�ڰ�·/include/�ڰ�·_Data.lua")
Include("scripts/Map/��������/include/Ѱ��_data.lua")
Include("scripts/Map/��������/include/��������_data.lua")
Include("scripts/Map/������/include/TongDungeonRaid.lh")--]]

Include("scripts/Include/OnEnterSceneCommon/Player_EnterSceneCommon_Include.lua")

-- �˺�������ʱ���ѵ�20MS���������
function OnEnterSceneCommon_Adventure0(player, scene)
	if not scene then
		scene = player.GetScene()		
	end
	local nStartIndex = BeginTimeStat()
	-- ���Ŀ�ʼ
	--�����������׶δ���------------
	if player.GetAdventureFlag(608) and not player.GetAdventureFlag(629) then  --scripts/Map/��������/������Ե����/event/������_ɽ��ͤ����.lua
		player.SetAdventureFlag(629, true)
	end
	--�����������׶δ���------------
	if player.GetAdventureFlag(1076) and not player.GetAdventureFlag(1077) then --scripts/Map/��������/������Ե����/npc/������_����.lua
		player.SetAdventureFlag(1077, true)
	end
	--����������׶δ���------------
	if player.GetAdventureFlag(1038) and not player.GetAdventureFlag(1039) then --scripts/Map/��������/������Ե����/npc/�����_��ĺ��.lua
		player.SetAdventureFlag(1039, true)
	end
	--��ݸ������׶δ���------------
	if player.GetAdventureFlag(1236) and not player.GetAdventureFlag(1253) then  --scripts/Map/��������/������Ե����/npc/��ݸ�_����.lua
		player.SetAdventureFlag(1253, true)
	end
	----�����������׶δ���--------
	if player.GetAdventureFlag(1126) and not player.GetAdventureFlag(1127) then
		player.SetAdventureFlag(1127, true)
	end

	if player.GetAdventureFlag(1168) and not player.GetAdventureFlag(1169) then
		player.SetAdventureFlag(1169, true)
	end

	if player.GetAdventureFlag(1170) and not player.GetAdventureFlag(1171) then
		player.SetAdventureFlag(1171, true)
	end
	--��������
	g_QYArtis.Artis_qiyuNPC(player, scene)
	--��������
	tRobAdventure.CreateNpcEnterMap(scene, player)

	-- �����Ṧ����ģʽ�����ͼȡ��
	if player.IsHaveBuff(10070, 0) then
		player.DelBuff(7838, 1)
	end

	-- ���������޹�
	Adventure_GirlInWind.OnEnterScene(player, scene)
	-- ����÷��׮
	tMaiHuaZhuangRank.CreateNpcAndDooadEnterMap(player)

	--��������������������
	Adventure_QINGMINGJING.OnEnterScene(player, scene)
	--������������ʤ���֡�
	Adventure_SHENGFUJU.OnEnterScene(player, scene)
	--����������������·��
	Adventure_GUIXIANGLU.OnEnterScene(player, scene)
	--��������������ͯ�顷
	Adventure_HAITONGSHU.OnEnterScene(player, scene)
	--���������������־ơ�
	Adventure_FENGLINJIU.OnEnterScene(player, scene)
	--���������������¸衷
	Adventure_HONGYIGE.OnEnterScene(player, scene)
	--������������׽���ǡ�
	Adventure_ZHUOYAOJI.OnEnterScene(player, scene)

	-- ��������ɽ�ĺ�
	g_QYTreasureHunt.CreateNpcEnterMap(player)
	if scene.dwMapID ~= 189 and scene.dwMapID ~= 190 then -- ɾ���ر������˱�ǣ�ֻ�����˲��л��ᴥ����������ɽ�ĺ�
		player.DelBuff(9139, 1)
	end
	if player.IsHaveBuff(9161, 1) and not player.GetAdventureFlag(1) then -- ������������
		player.SetTimer(16 * 15, "scripts/Map/��������/npc/Ѱ��_����ھ�.lua", 0, 0);
	end

	TongDungeonRaid.OnPlayerEnterScene(player, scene)
	-- �������ڰ�·
	Adventure_BWRoad.OnEnterScene(player, scene)

	g_QYWeapon.CreateNpcError(player, scene)
	QiZhouNian_JiangHuHuaShan(player)  --�����꽭�����ȵ���
	g_QYYinYang.NPCcreat(player, scene)  --����������������NPC
	g_QYBiaoShi.NPCcreat(player, scene)  --�������Ӳ���NPC
	if scene.dwMapID == 273 or scene.dwMapID == 272 then
		g_QYSpicyFish.Condition(player)  --����ˮ�������BUFF
	end
	if scene.dwMapID == 74 or scene.dwMapID == 108 then
		g_QYSpicyFish.NPCcreat(player, scene)
	end
	--�����Ե
	Adventure_TeaHouseAdventure.OnEnterScene(player, scene)

	tQiXiu_Rabbit.CreateNpcEnterMap(player, scene)

		--ƽ����Ը
	Adventure_ReadBookAdventure.OnEnterScene(player, scene)
	
	-- ���Ľ���
	OnEnterSceneCommon_CallNextFunc(player, scene)
	EndTimeStat(nStartIndex, ENTERSCENECOMMON_FUNC_TIME_LIMIT)
end

function QiZhouNian_JiangHuHuaShan(player)
	local GV = GetGameVersion()
	if not GV then
		return
	end
	local nTime = GetCurrentTime()
	local nStartTime = DateToTime(2011, 8, 27, 7, 0, 0)  --��������ʼʱ��
	local nEndTime = DateToTime(2011, 9, 14, 7, 0, 0)  --���������ʱ��
	if GV.VersionLineName == "zhcn" then --���ڰ汾
		nStartTime = DateToTime(2016, 8, 28, 7, 0, 0)  --��������ʼʱ��
		nEndTime = DateToTime(2016, 9, 12, 7, 0, 0)  --���������ʱ��
	end
	if nStartTime >= nTime or nTime >= nEndTime then
		return  -- ʱ������
	end
	local nBuff_Time = nEndTime - nTime
	if not player.IsHaveBuff(11104, 1) then
		player.AddBuff(0, 99, 11104, 1, nBuff_Time)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
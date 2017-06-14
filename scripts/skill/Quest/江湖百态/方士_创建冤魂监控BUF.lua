---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/������̬/��ʿ_����ԩ����BUF.lua
-- ����ʱ��:	2016/6/14 10:50:17
-- �����û�:	wangwei2
-- �ű�˵��:
----------------------------------------------------------------------<
Include("scripts/Map/������̬/��ʿ/include/��ʿ_Data.lua")
Include("scripts/Map/��¹��ԭ/include/�ݵ�����_Data.lh")

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local buff = player.GetBuff(10842, 1)
	if buff then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	if player.dwIdentityVisiableID ~= 0 then
		return
	end
	--��С����ʱ�����ͷŴ˼���
	if CastleFight.CheckPrepareTime() then
		local tActivityMap = CastleFight.GetMapActivityState()
		if tActivityMap[scene.dwMapID] then
			return
		end
	end
	--�Ѿ���׷���������жϣ���BUFF�жϻ���һ֡��ֱ���ж�NPC�Ƿ����
	local ghost_npc = scene.GetNpcByNickName("Identity_Ghost" .. player.dwID) or scene.GetNpcByNickName("Identity_Ghost" .. player.dwID .. "Out")
	if ghost_npc then
		return
	end
	------------�ж��ǲ��ǿ��ó�����0��Ұ�⡢���ɵ�ͼ-----------
	if scene.nType ~= 0 then
		player.DelBuff(10841, 1)
		return
	end
	local tSceneList = {
		[6] = 1, [150] = 1, [102] = 1, [193] = 1, [158] = 1
	}
	if not tSceneList[scene.dwMapID] then
		return
	end
	------------ֻ�����ߡ�վ���;�ֹ״̬���Դ������------------------
	if player.nMoveState ~= MOVE_STATE.ON_STAND and player.nMoveState ~= MOVE_STATE.ON_SIT and player.nMoveState ~= MOVE_STATE.ON_WALK then
		return
	end
	Identity_CreatGhost1_5(player, 1)      --��������
	--local nRate_Ghost1 = Random(1000000)    --0.01%��100 ���˻����
	--local nRate_Ghost2 = Random(1000000)    --0.0005%��5 ��5�˻����
	local nRate_Ghost1 = Random(100)    --0.01%��100 ���˻����
	local nRate_Ghost2 = Random(100)    --0.0005%��5 ��5�˻����
	local nTimes = 10
	if nRate_Ghost1 == 50 then	-- ��ʱ����Ϊ1%
		local nIndex = 1
		local nRandom = Random(1000000)
		if nRandom <= 700000 then
			nIndex = 1
		elseif nIndex <= 990000 then
			nIndex = 2
		else
			nIndex = 3
		end
		Identity_CreatGhost1_5(player, nIndex)      --��������
	elseif nRate_Ghost2 < 105 * nTimes then         
		--RemoteCallToCenter("On_Identity_CheckCD", player.dwID, 5)     --�жϷ�����CD����,��һ�NPC ID�����ǿ��	
	end
	
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
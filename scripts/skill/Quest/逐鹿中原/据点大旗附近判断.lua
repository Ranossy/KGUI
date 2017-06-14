---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/��¹��ԭ/�ݵ���츽���ж�.lua
-- ����ʱ��:	2016/12/6 15:49:05
-- �����û�:	qinfupi
-- �ű�˵��:	���ڿ󳵸���Χ����Ҽӷ֡�ÿ3����һ�Σ���On_PQ.lua����ֱ����ӡ��ú��Ӳ�Ҫѧ��
----------------------------------------------------------------------<
Include("scripts/Map/��¹��ԭ/include/�ݵ�����_Data.lh")

--��ͼ�;ݵ�ID��
local tMapAndJuDianID =
{
	[30] = {301,301},	--���������������������
	[22] = {221,221},	--���������������������
	[23] = {231,232},
	[153] = {1531,1532},
	[103] = {1031,1032},
	[104] = {1041,1042},
	[139] = {1391,1392},
	[35] = {351,352},
	[100] = {1001,1002},
	[101] = {1011,1012},
	[13] = {131,132},
	[9] = {91,92},
	[21] = {211,212},
	[105] = {1051,1052},
}

-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	--�δ�����Ļ�Ҳ���Է�����
	local StateInfo = GetActivityState(378)
	if not StateInfo then
		if player.GetBuff(11564,1) then 	--ɾ��ս��buff
			player.DelBuff(11564,1)
		end
		return
	end
	if not(StateInfo == ACTIVITY_STATE.NORMAL_ON or StateInfo == ACTIVITY_STATE.RECOVER_ON) then
		if player.GetBuff(11564,1) then 	--ɾ��ս��buff
			player.DelBuff(11564,1)
		end
		return
	end
	
	--���˲�������buff
	if player.nMoveState == MOVE_STATE.ON_DEATH then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	
	--������������buff
	if player.nCamp == CAMP.NEUTRAL and player.GetBuff(11564, 1) then
		player.DelBuff(11564, 1)
		return
	end
	
	--̫��״̬����
	if player.GetBuff(961, 1) then
		return
	end

	if player.dwIdentityVisiableID ~= 0 and player.dwIdentityVisiableID ~= 6 then	-- λ���ж�
		return
	end
	
	-- Ԧ��״̬�ж�
	if player.GetBuff(10864, 1) then	
		return
	end
	
	--��ʽ�ж�
	local nMapID = scene.dwMapID
	local sNickName = "DaQiZhaoZi_"

	if tMapAndJuDianID[nMapID] then	--��ɳ�̵�ͼ
		local sZhaoZiName1 = sNickName .. tMapAndJuDianID[nMapID][1]		
		local npcZhaoZi1 = scene.GetNpcByNickName(sZhaoZiName1)
		local sZhaoZiName2 = sNickName .. tMapAndJuDianID[nMapID][2]
		local npcZhaoZi2 = scene.GetNpcByNickName(sZhaoZiName2)
		if npcZhaoZi1 and GetCharacterDistance(npcZhaoZi1.dwID, player.dwID) < 960 then --�͵�һ������15��֮��				
			local CastleData = CastleFight.GetCastleData(tMapAndJuDianID[nMapID][1])
			local nCamp = CastleData.GetInt8(Castle_Value_Name.Camp)
			if nCamp == player.nCamp and not player.GetBuff(11564, 1) then 				--������Ӫ��������ս��buff
				player.AddBuff(0, 99, 11564, 1)
			end
		elseif npcZhaoZi2 and GetCharacterDistance(npcZhaoZi2.dwID, player.dwID) < 960 then	--�͵ڶ�������15��֮��
			local CastleData = CastleFight.GetCastleData(tMapAndJuDianID[nMapID][2])
			local nCamp = CastleData.GetInt8(Castle_Value_Name.Camp)
			if nCamp == player.nCamp and not player.GetBuff(11564, 1) then 				--������Ӫ��������ս��buff
				player.AddBuff(0,99,11564,1)
			end	
		else
			if player.GetBuff(11564, 1) then 	--������������㸽��
				player.DelBuff(11564,1)
			end	
		end
	else	--����ɳ�̵�ͼ
		if player.GetBuff(11564, 1) then
			player.DelBuff(11564,1)
		end
		if player.GetBuff(11561, 1) then
			player.DelBuff(11561,1)
		end	
	end	
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
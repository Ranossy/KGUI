---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/��ֵ�/���ݷ�_�����ảƽ̯�˺�buff.lua
-- ����ʱ��:	2015/9/9 15:20:38
-- �����û�:	xutong3
-- �ű�˵��:
----------------------------------------------------------------------<
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
local SELFID = 9678
local SHIELD = 300000
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return	
	end
	local scene = player.GetScene()
	local npc = nil
	local nTotalUsedValue = 0
	local tAbsorbInfo = nil
	--print(tAbsorbInfo[1].nAbsorbType,tAbsorbInfo[1].nAbsorbValue,tAbsorbInfo[1].nAbsorbUsedValue)
	--if tAbsorbInfo[1].nAbsorbUsedValue >= 10000 then
	--npc.DelBuff(9346,1)
	--end
	for i = 1, 3 do
		npc = scene.GetNpcByNickName(player.dwID.."yangyifei_"..i)
		if npc then
			tAbsorbInfo = npc.GetAbsorbInfo()
		end
		if tAbsorbInfo and #tAbsorbInfo >= 1 then
			nTotalUsedValue = nTotalUsedValue + tAbsorbInfo[1].nAbsorbUsedValue
		end
	end
	tAbsorbInfo = player.GetAbsorbInfo()
	if tAbsorbInfo and #tAbsorbInfo >= 1 then
		for i = 1, #tAbsorbInfo do
			nTotalUsedValue = nTotalUsedValue + tAbsorbInfo[i].nAbsorbUsedValue
		end
	end
	if nTotalUsedValue < SHIELD then
		return
	end
	---ɾ������
	for i = 1, 3 do
		npc = scene.GetNpcByNickName(player.dwID.."yangyifei_"..i)
		if npc then
			scene.DestroyNpc(npc.dwID)
		end
	end
	player.DelBuff(SELFID, 1)
	print(nTotalUsedValue)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
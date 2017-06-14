---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/�����Ǳ�/����_����ʦ_��ӡ����.lua
-- ����ʱ��:	2016/9/17 17:40:59
-- �����û�:	zhengfeng5
-- �ű�˵��:
----------------------------------------------------------------------<
local tTargetList = {
	--["mtyys9"] = "mtxjlq2",
	--["mtyys10"] = "mtxjlq2",
	--["mtyys21"] = "mtxjlq1",
	--["mtyys11"] = "mtxjlq1",
	--["mtyys12"] = "mtxjlq2",
	--["mtyys13"] = "mtxjlq2",
	--["mtyys14"] = "mtxjlq3",
	--["mtyys15"] = "mtxjlq3",
	--["mtyys16"] = "mtxjlq4",
	--["mtyys17"] = "mtxjlq4",
	--["mtyys18"] = "mtxjlq5",
	--["mtyys19"] = "mtxjlq5",
	["mtxjlq1"] = "mtxjlq2",
	["mtxjlq2"] = "mtxjlq3",
	["mtxjlq3"] = "mtxjlq4",
	["mtxjlq4"] = "mtxjlq5",
	["mtxjlq5"] = "mtxjlq1",
}

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local scene = npc.GetScene()
	if not scene then
		return 
	end
	if not tTargetList[npc.szName] then
		return
	end
	local npcTarget = scene.GetNpcByNickName(tTargetList[npc.szName])
	if not npcTarget then
		return 
	end
	npc.SetTarget(TARGET.NPC, npcTarget.dwID)
	npc.CastSkill(16969, 1)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local npc = GetNpc(nCharacterID)
	if npc then
		npc.AddBuff(0, 99, 11242, 1, 1000)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
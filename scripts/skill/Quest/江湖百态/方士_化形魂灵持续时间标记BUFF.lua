---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/������̬/��ʿ_���λ������ʱ����BUFF.lua
-- ����ʱ��:	2016/6/18 11:27:10
-- �����û�:	wangwei2
-- �ű�˵��:
----------------------------------------------------------------------<

--[[ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
--]]
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local npc = GetNpc(nCharacterID)
	if not npc then
		return
	end
--[[	if nLeftFrame == 0 then
		if npc.bFightState == false then
			npc.SetDisappearFrames(1)
		else
			npc.AddBuff(npc.dwID, npc.nLevel, 10862, 1, 1)  --���NPC��ս��״̬����һ�롣
			return
		end
	end
	local dwID = npc.GetCustomInteger4(1)
	local player = GetPlayer(dwID)
	if player then
		player.PlaySfx(1354, npc.nX, npc.nY, npc.nZ)
	else
		npc.PlaySfx(1354, npc.nX, npc.nY, npc.nZ)
		npc.SetDisappearFrames(16)                           --NPC������Чʱ,��ʧʱ���ӳ�,������Ч����ȫ
	end	--]]
	if not npc.bFightState and nLeftFrame == 0 then
		npc.dwDropTargetPlayerID = 0
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/item/������������_������Ѱ�׻�ɽ����ʱbuffremove.lua
-- ����ʱ��:	2016/6/8 17:12:31
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(nCharacterID)
	if player then
		if not player.GetBuff(11185, 1) then
			if player.nMoveState ~= MOVE_STATE.ON_DEATH then
				player.DoAction(0, 60124)
			end
			player.DelBuff(8576, 1)
			player.DelBuff(10821, 1)
			player.DelBuff(10823, 1)
			player.DelBuff(10824, 1)
			player.DelBuff(10825, 1)
			player.SetDynamicSkillGroup(0)
		end
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
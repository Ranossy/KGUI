---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/ս�ҷ㻪��_��������.lua
-- ����ʱ��:	2016/10/20 11:40:15
-- �����û�:	wangwei2
-- �ű�˵��:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
    player.DelBuff(2587, 1)	
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
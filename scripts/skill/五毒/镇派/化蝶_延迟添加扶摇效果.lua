---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�嶾/����/����_�ӳ���ӷ�ҡЧ��.lua
-- ����ʱ��:	2017/3/19 16:44:42
-- �����û�:	XIAXIANBO1
-- �ű�˵��:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local lv = player.GetSkillLevel(9002)
	if lv ~= 0 then
		local buff = player.GetBuff(11816, 1)
		if not buff then
			return
		end
		local nCount = buff.nLeftActiveCount
		player.AddBuff(player.dwID, player.nLevel, 208, lv, nCount)
		player.DelBuff(11816,1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���ܵ���/ʦͽϵͳ_ɡ�Ҽ�_����.lua
-- ����ʱ��:	2016/8/19 11:22:48
-- �����û�:	jiangzhefei1
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	player.AddBuff(0, 99, 1593, 1, 1) --�������л�ģ����������Buff
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(nCharacterID)
	player.AddBuff(0, 99, 1593, 1, 1) --�������л�ģ����������Buff
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
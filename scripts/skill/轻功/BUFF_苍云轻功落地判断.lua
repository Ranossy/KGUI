---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�Ṧ/BUFF_�����Ṧ����ж�.lua
-- ����ʱ��:	2014/9/24 16:27:58
-- �����û�:	zhangyan3
-- �ű�˵��:
----------------------------------------------------------------------<
-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
function Apply(dwCharacterID)
end
--
-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and player.nMoveState ~= MOVE_STATE.ON_JUMP then
	--	player.CastSkill(13202, 1)	--	player.PlaySfx(30,0,0,0)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
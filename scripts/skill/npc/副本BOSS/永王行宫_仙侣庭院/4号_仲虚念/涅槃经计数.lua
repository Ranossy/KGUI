---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�����й�_����ͥԺ/4��_������/����������.lua
-- ����ʱ��:	2015/9/15 14:33:18
-- �����û�:	WANGZEYU
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local Target = GetPlayer(dwCharacterID)
	if Target and Target.nMoveState ~= MOVE_STATE.ON_DEATH then
		local PBuff = Target.GetBuff(9762, 1)
		if PBuff and PBuff.nStackNum == 10 then
			Target.Die()
		end
		local BBuff = Target.GetBuff(9762, 2)
		if BBuff and BBuff.nStackNum == 10 then
			Target.Die()
		end
		local BBuff = Target.GetBuff(9762, 3)
		if BBuff and BBuff.nStackNum == 10 then
			Target.Die()
		end
		local BBuff = Target.GetBuff(9762, 4)
		if BBuff and BBuff.nStackNum == 10 then
			Target.Die()
		end
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
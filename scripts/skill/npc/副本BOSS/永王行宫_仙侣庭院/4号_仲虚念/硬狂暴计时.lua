---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�����й�_����ͥԺ/4��_������/Ӳ�񱩼�ʱ.lua
-- ����ʱ��:	2015/11/17 20:21:07
-- �����û�:	WANGZEYU
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local TPlayer = GetNpc(dwCharacterID)
	if not TPlayer then
		return
	end

	local scene = TPlayer.GetScene()
	if not scene then
		return
	end

	local AllPlayer = scene.GetAllPlayer()
	for i = 1, #AllPlayer do
		local Target = GetPlayer(AllPlayer[i])
		if Target and Target.nMoveState ~= MOVE_STATE.ON_DEATH then
			TPlayer.PlaySfx(1155, Target.nX, Target.nY, Target.nZ)
		end
	end

	local Area_Con = scene.GetNpcByNickName("MonkArea_Control")
	local Monk = scene.GetNpcByNickName("Zhongxunian")
	if Area_Con and Monk then
		for i = 1, 3 do
			Monk.CastSkillXYZ(14112, 3, Area_Con.nX, Area_Con.nY, Area_Con.nZ)
			Monk.AddBuff(0,99,3819,1)
		end
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
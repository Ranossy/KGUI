---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������������boss/��ʥ/ӡ֮������.lua
-- ����ʱ��:	2015/9/30 16:58:52
-- �����û�:	WANGZEYU
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local TPlayer = GetPlayer(dwCharacterID)
	if not TPlayer then
		return
	end

	if TPlayer.nMoveState == MOVE_STATE.ON_STAND then
		TPlayer.AddBuff(0, 99, 9953, 1)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
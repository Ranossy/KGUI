---------------------------------------------------------------------->
-- �ű�����:	K:/����Ŀ¼/client/scripts/skill/item/ݶ��ʥ��_������������1.5��.lua
-- ����ʱ��:	2012/8/9 17:15:03
-- �����û�:	xiaoxiao
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local tnpc = GetNpc(dwCharacterID)
	if not tnpc then
		return
	end
	if tnpc.nMoveState == MOVE_STATE.ON_KNOCKED_DOWN and tnpc.nTouchRange < 120 then
		tnpc.SetPosition(tnpc.nX, tnpc.nY, tnpc.nZ - 2.6 * 8 * 64)
		local scene = tnpc.GetScene()
		if not scene then
			return
		end
		scene.SetTimer(4, "scripts/skill/item/ݶ��ʥ��_������������1.5��.lua", tnpc.dwID, 0)
	end
	--tnpc.CastSkill(4106,1)
end
function OnTimer(scene, value1, value2)
	local tnpc = GetNpc(value1)
	if not tnpc then
		return
	end
	tnpc.PlaySfx(203, 0, 0, 0) 
	tnpc.PlaySfx(206, 0, 0, 0)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
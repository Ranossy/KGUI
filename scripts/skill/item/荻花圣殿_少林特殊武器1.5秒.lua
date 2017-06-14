---------------------------------------------------------------------->
-- 脚本名称:	K:/主干目录/client/scripts/skill/item/荻花圣殿_少林特殊武器1.5秒.lua
-- 更新时间:	2012/8/9 17:15:03
-- 更新用户:	xiaoxiao
-- 脚本说明:	
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
		scene.SetTimer(4, "scripts/skill/item/荻花圣殿_少林特殊武器1.5秒.lua", tnpc.dwID, 0)
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
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
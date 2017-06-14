---------------------------------------------------------------------->
-- 脚本名称:	F:/zhugan/client/scripts/skill/装备/剑纯特殊武器_回镜头.lua
-- 更新时间:	2013/1/30 15:09:47
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)

end

function UnApply(dwCharacterID)

end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	if nLeftFrame ~= 0 then
		player.PlayCameraAnimation(0, 0)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
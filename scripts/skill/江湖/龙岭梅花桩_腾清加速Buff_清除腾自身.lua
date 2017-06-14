
------------------------------------------------
-- 文件名    :  龙岭梅花桩_腾清加速Buff_清除腾自身.lua
-- 创建人    :  蜘蛛
-- 创建时间  :  2010-04-27
------------------------------------------------

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	if not IsPlayer(nCharacterID) then
        return
    end
    local player = GetPlayer(nCharacterID)
    if not player then
    	return
    end
	player.AddBuff(0, 99, 1851, 1, 1)  --清除腾自身的buff
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
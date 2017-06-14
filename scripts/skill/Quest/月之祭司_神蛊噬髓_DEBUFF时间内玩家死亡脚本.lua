------------------------------------------------
-- 文件名    :  月之祭司_神蛊噬髓_DEBUFF时间内玩家死亡脚本
-- 创建人    :  zhx
-- 创建时间  :  20110407
-- 用途(模块):  PQ
-- 武功门派  :  无
-- 武功类型  :  无
-- 武功套路  :  无
-- 技能名称  :  无
-- 技能效果  :  DEBUFF时间内玩家死亡,则BOSS回血
------------------------------------------------

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
    local npc   
    if IsPlayer(nCharacterID) then
        npc = GetPlayer(nCharacterID)
    else
        return
    end
    local scene = npc.GetScene()
	local npc1 = scene.GetNpcByNickName("PQ_yuezhijisi11")
	if not npc1 then 
		return
	end
    if nLeftFrame == 0 then 
    else
    	npc1.nCurrentLife = npc1.nCurrentLife + 810000
    end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
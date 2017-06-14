---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/五毒/秘笈/女娲点掉删秘籍.lua
-- 更新时间:	2013/4/29 17:17:34
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local character
	local tplayer
	local npc
	if IsPlayer(nCharacterID) then
		tplayer = GetPlayer(nCharacterID);
	else
		npc = GetNpc(nCharacterID);
	end

	if not (nLeftFrame == 0) then
		tplayer.DelBuff(3414, 1)
		tplayer.DelBuff(3415, 1)
		tplayer.DelBuff(3414, 2)
		tplayer.DelBuff(3415, 2)
		for i = 1, 4 do
			tplayer.DelBuff(3068, i)
		end
		tplayer.DelBuff(5778, 1)
	end
end;
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
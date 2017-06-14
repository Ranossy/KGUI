---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/90级奇穴/切二内删除剑舞.lua
-- 更新时间:	2013/9/13 16:19:46
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)--624buff——3秒回一点气
	local i, j, k
	local nSkill = player.GetKungfuMount()
	if player then
		if nSkill ~= nil and nSkill.dwSkillID ~= 10080 and nSkill.dwSkillID ~= 10081 then
			for i = 1, 10 do
				for j = 1, 7 do
					player.DelBuff(409, j + 14)
				end
				for k = 1, 7 do
					player.DelBuff(2352, k)
				end
				player.AddBuff(0, 99, 3901, 1, 1)
			end
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
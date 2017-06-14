---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/轻功/八大派/七秀/七秀BUFF监控_DOT.lua
-- 更新时间:	2016/4/21 3:32:42
-- 更新用户:	zhangyan-pc
-- 脚本说明:	--鱼头实测备注：一个BUFF的每跳脚本中的Apply 函数，每跳时候触发
--鱼头实测备注：一个BUFF的每跳脚本中的UnApply 函数是无效的
----------------------------------------------------------------------<

--鱼头实测备注：一个BUFF的每跳脚本中的Apply 函数，每跳时候触发
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if player.bOnHorse then
		return
	end

	if player.bSprintFlag then
		local buffid_no = 10695 
		local buffid_yes = 10694

		local buff_no = player.GetBuff(buffid_no, 1)
		local buff_yes = player.GetBuff(buffid_yes, 1)
		
		if not buff_no then

			if not buff_yes then

				player.AddBuff(0, 99, buffid_yes, 1, 60)
			end
		end
	end
end

-- 鱼头实测备注：一个BUFF的每跳脚本中的 UnApply 函数是无效的
function UnApply(dwCharacterID)
	--无效
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
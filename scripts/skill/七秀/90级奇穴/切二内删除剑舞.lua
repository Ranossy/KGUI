---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/�ж���ɾ������.lua
-- ����ʱ��:	2013/9/13 16:19:46
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)--624buff����3���һ����
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
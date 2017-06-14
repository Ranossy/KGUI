---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���ֺ���/�����Ұ������.lua
-- ����ʱ��:	2017/2/18 1:21:05
-- �����û�:	CHENGSIHAN
-- �ű�˵��:
----------------------------------------------------------------------<

-- ��һ���������õ�ʱ�򴥷�, ����Ϊ���õĶ���ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	local scene = npc.GetScene()
	if npc.GetBuff(11722, 1) then
		local Nbuff = npc.GetBuff(11722, 1)
		local Num = Nbuff.nStackNum		--���buff�Ĳ���
		if Num == 3 then
			if scene then
				local tDirection = {}
				tDirection[1] = npc.nFaceDirection
				tDirection[2] = npc.nFaceDirection - 30 % 256
				tDirection[3] = npc.nFaceDirection + 30 % 256
			for i = 1,  3 do
				local nY = npc.nY + math.floor(math.sin(tDirection[i] / 128 * math.pi) * 10 * 64)
				local nX = npc.nX + math.floor(math.cos(tDirection[i] / 128 * math.pi) * 10 * 64)
				local npcDt = scene.CreateNpc(55918, npc.nX, npc.nY, npc.nZ, npc.nFaceDirection, - 1)
				if npcDt then
					npcDt.RunTo(nX, nY)
				end
			end
		end			--3���ٻ�npc
	end
	end
end
-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
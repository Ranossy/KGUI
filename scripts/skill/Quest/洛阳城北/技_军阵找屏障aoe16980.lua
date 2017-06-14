---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/�����Ǳ�/��_����������aoe16980.lua
-- ����ʱ��:	2016/10/4 19:46:09
-- �����û�:	xutong3
-- �ű�˵��:
----------------------------------------------------------------------<

----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  �ź�
-- ����ʱ��	:  2013-10-9
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/Quest/�����Ǳ�/��_����������aoe16980.lua", -- ����ֵ1
		0																	-- ����ֵ2
	);
	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 40 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	skill.nHeight = 50 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	skill.nRectWidth = 10 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
--	skill.nRectRotation = 128--
	--skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius = 50 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 30;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)
	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)

end

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)

end
local tBiLei = {
	[53071] = 1,
	[53074] = 1,
	[53091] = 1,
	[53086] = 1,
	[53080] = 1,
	[53081] = 1,
	[53101] = 1,
	[53096] = 1.
}
local COMMON_SOLDIERS = {--�����Ҫ�ġ�
	BELONGPQID = 0, --
	BELONGPQID2 = 2, --
	BELONGPQID3 = 4, --ռ2λ
	ISONPATRO = 6, --ռһλ
	KEEPFORMATION = 7, --ռһλ��0��ʾ��������״̬��f1��ʾ������ɢ״̬��
	TARGETX = 8, --ǰ��Ŀ��x��ռ4λ��
	TARGETY = 12, --ǰ��Ŀ��Y��ռ4λ��
	RETURNX = 16, --ԭ�㡣���ڷ���
	RETURNY = 20, --ԭ�㡣
	RETURNZ = 24, --ԭ��
	FINDPINZHANG = 28,--������ ��ռ1λ
}
local nMaxDis = 50 * 64
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
local function GetPointOffset(nX1, nY1, nX2, nY2, nOffSet)--ȡ��������ֱ������ԣ�X1,Y1����ƫ��nOffSet�ĵ�����
	local nS = math.sqrt(  math.pow((nX2 - nX1), 2) + math.pow((nY2 - nY1), 2))
	local nScale = nOffSet / nS
	local nTX = (nX2 - nX1) * nScale + nX1
	local nTY = (nY2 - nY1) * nScale + nY1	

	return nTX, nTY
end
function Apply(dwCharacterID, dwSelfID)
	local npc = GetNpc(dwSelfID)

--	print(npc.szName, "Apply")
	if not npc then
		return
	end
	local target = GetNpc(dwCharacterID)
	if not target then
		return
	end
	--print(target.szName, "target")
	if not tBiLei[target.dwTemplateID] then
		return
	end
	local nNewX,nNewY = GetPointOffset(target.nX, target.nY, npc.nX, npc.nY, 300)
	local nCurrentDisSq = GetDistanceSq(nNewX,nNewY,0,npc.nX,npc.nY,0)

	local nCurrentX = npc.GetCustomUnsigned4(COMMON_SOLDIERS.TARGETX)
	local nCurrentY = npc.GetCustomUnsigned4(COMMON_SOLDIERS.TARGETY)

	if nCurrentDisSq < GetDistanceSq(nCurrentX, nCurrentY, 0, npc.nX, npc.nY, 0) then
		
		npc.SetCustomUnsigned4(COMMON_SOLDIERS.TARGETX,nNewX)
		npc.SetCustomUnsigned4(COMMON_SOLDIERS.TARGETY, nNewY)
		npc.SetCustomBoolean(COMMON_SOLDIERS.FINDPINZHANG,true)
		--	print("�趨�µ�Ŀ��㣬����",nCurrentDisSq,nNewX,nNewY)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
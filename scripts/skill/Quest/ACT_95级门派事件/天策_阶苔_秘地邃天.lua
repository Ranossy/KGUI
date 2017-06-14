---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/ACT_95�������¼�/���_��̦_�ص�����.lua
-- ����ʱ��:	2015/12/18 18:00:26
-- �����û�:	mantong2
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 50, nDamageBase = 108, nDamageRand = 3}, -- Level 1
	{nAddRage = 0, nCostRage = 50, nDamageBase = 124, nDamageRand = 4}, -- Level 2
	{nAddRage = 0, nCostRage = 50, nDamageBase = 140, nDamageRand = 5}, -- Level 3
	{nAddRage = 0, nCostRage = 50, nDamageBase = 156, nDamageRand = 5}, -- Level 4
	{nAddRage = 0, nCostRage = 50, nDamageBase = 172, nDamageRand = 6}, -- Level 5
	{nAddRage = 0, nCostRage = 50, nDamageBase = 188, nDamageRand = 7}, -- Level 6
	{nAddRage = 0, nCostRage = 50, nDamageBase = 204, nDamageRand = 8}, -- Level 7
	{nAddRage = 0, nCostRage = 50, nDamageBase = 220, nDamageRand = 9}, -- Level 8
	{nAddRage = 0, nCostRage = 50, nDamageBase = 236, nDamageRand = 9}, -- Level 9
	{nAddRage = 0, nCostRage = 50, nDamageBase = 252, nDamageRand = 10}, -- Level 10
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	--�˺�����
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		0,
		1
	);

	----------------- BUFF��� -------------------------------------------------

	----------------- ����������� ----------------------------------------------------------------------
	skill.nPrepareFrames  	= 80;				-- ����֡��
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	--skill.nChannelInterval = 10; 				-- ͨ�������ʱ��
	--skill.nChannelInterval = 10; 				-- ͨ�������ʱ��
	--skill.nChannelFrame = 80;	 			-- ͨ��������ʱ�䣬��λ֡��
	skill.nMinRadius = 0 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 12 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 256; 										--ʩ�ŽǶ�,ȫ��256
	--skill.nWeaponDamagePercent	= 2048;
	--skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
	skill.nMinChannelInterval = 2;-- ͨ�������ʱ��
	skill.nMinChannelFrame = 2
	--skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
	--skill.nAreaRadius		= 6 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 10;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ���˴��������� -------------------------------------------------
	skill.nBeatBackRate = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	skill.nBrokenRate = 0 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)

end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)

end
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
end



 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
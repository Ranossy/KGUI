---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��·���Ӽ���/����_��ѩ��_ն������Ŀ��.lua
-- ����ʱ��:	2014/10/21 20:34:15
-- �����û�:	zhouyixiao2
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_����ǹ��_����.lua
-- ������    :  ����
-- ����ʱ��  :  2008-02-26 16:14
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����ǹ��
-- ��������  :  ����
-- ����Ч��  :  ʹ��ǹ֮����������ǹӰ���ֶ��֣������޷�����ֻ��Ӧս��ͬʱ��һ���˺�����ޡ�
--                   ����Ѫս����Ŀ���޷��ƶ�����������ǿ�Ƴ��Ŀ�꣩
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--���ӳ���ݶ��ͼ����˺����
tSkillData =
{
	{nCostMana = 27, nDebuffLevel = 1, nDamage = 27 * 0.95, nDamageRand = 31 * 0.1, nThreat = 151  }, -- Level 1
	{nCostMana = 46, nDebuffLevel = 1, nDamage = 46 * 0.95, nDamageRand = 43 * 0.1, nThreat = 211  }, -- Level 2
	{nCostMana = 88, nDebuffLevel = 1, nDamage = 88 * 0.95, nDamageRand = 56 * 0.1, nThreat = 271  }, -- Level 3
	{nCostMana = 165, nDebuffLevel = 1, nDamage = 165 * 0.95, nDamageRand = 69 * 0.1, nThreat = 331  }, -- Level 4
	{nCostMana = 252, nDebuffLevel = 1, nDamage = 252 * 0.95, nDamageRand = 81 * 0.1, nThreat = 391  }, -- Level 5
	{nCostMana = 390, nDebuffLevel = 1, nDamage = 390 * 0.95, nDamageRand = 94 * 0.1, nThreat = 452  }, -- Level 6
	{nCostMana = 27, nDebuffLevel = 1, nDamage = 27 * 0.95, nDamageRand = 31 * 0.1, nThreat = 151  }, -- Level 1
	{nCostMana = 46, nDebuffLevel = 1, nDamage = 46 * 0.95, nDamageRand = 43 * 0.1, nThreat = 211  }, -- Level 2
	{nCostMana = 88, nDebuffLevel = 1, nDamage = 88 * 0.95, nDamageRand = 56 * 0.1, nThreat = 271  }, -- Level 3
	{nCostMana = 165, nDebuffLevel = 1, nDamage = 165 * 0.95, nDamageRand = 69 * 0.1, nThreat = 331  }, -- Level 4
	{nCostMana = 252, nDebuffLevel = 1, nDamage = 252 * 0.95, nDamageRand = 81 * 0.1, nThreat = 391  }, -- Level 5
	{nCostMana = 390, nDebuffLevel = 1, nDamage = 390 * 0.95, nDamageRand = 94 * 0.1, nThreat = 452  }, -- Level 6
	{nCostMana = 27, nDebuffLevel = 1, nDamage = 27 * 0.95, nDamageRand = 31 * 0.1, nThreat = 151  }, -- Level 1
	{nCostMana = 46, nDebuffLevel = 1, nDamage = 46 * 0.95, nDamageRand = 43 * 0.1, nThreat = 211  }, -- Level 2
	{nCostMana = 88, nDebuffLevel = 1, nDamage = 88 * 0.95, nDamageRand = 56 * 0.1, nThreat = 271  }, -- Level 3
	{nCostMana = 165, nDebuffLevel = 1, nDamage = 165 * 0.95, nDamageRand = 69 * 0.1, nThreat = 331  }, -- Level 4
	{nCostMana = 252, nDebuffLevel = 1, nDamage = 252 * 0.95, nDamageRand = 81 * 0.1, nThreat = 391  }, -- Level 5
	{nCostMana = 390, nDebuffLevel = 1, nDamage = 390 * 0.95, nDamageRand = 94 * 0.1, nThreat = 452  }, -- Level 6
	{nCostMana = 27, nDebuffLevel = 1, nDamage = 27 * 0.95, nDamageRand = 31 * 0.1, nThreat = 151  }, -- Level 1
	{nCostMana = 46, nDebuffLevel = 1, nDamage = 46 * 0.95, nDamageRand = 43 * 0.1, nThreat = 211  }, -- Level 2
	{nCostMana = 88, nDebuffLevel = 1, nDamage = 88 * 0.95, nDamageRand = 56 * 0.1, nThreat = 271  }, -- Level 3
	{nCostMana = 165, nDebuffLevel = 1, nDamage = 165 * 0.95, nDamageRand = 69 * 0.1, nThreat = 331  }, -- Level 4
	{nCostMana = 252, nDebuffLevel = 1, nDamage = 252 * 0.95, nDamageRand = 81 * 0.1, nThreat = 391  }, -- Level 5
	{nCostMana = 390, nDebuffLevel = 1, nDamage = 390 * 0.95, nDamageRand = 94 * 0.1, nThreat = 452  }, -- Level 6
	{nCostMana = 27, nDebuffLevel = 1, nDamage = 27 * 0.95, nDamageRand = 31 * 0.1, nThreat = 151  }, -- Level 1
	{nCostMana = 46, nDebuffLevel = 1, nDamage = 46 * 0.95, nDamageRand = 43 * 0.1, nThreat = 211  }, -- Level 2
	{nCostMana = 88, nDebuffLevel = 1, nDamage = 88 * 0.95, nDamageRand = 56 * 0.1, nThreat = 271  }, -- Level 3
	{nCostMana = 165, nDebuffLevel = 1, nDamage = 165 * 0.95, nDamageRand = 69 * 0.1, nThreat = 331  }, -- Level 4
	{nCostMana = 252, nDebuffLevel = 1, nDamage = 252 * 0.95, nDamageRand = 81 * 0.1, nThreat = 391  }, -- Level 5
	{nCostMana = 390, nDebuffLevel = 1, nDamage = 390 * 0.95, nDamageRand = 94 * 0.1, nThreat = 452  }, -- Level 6
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = 1;
--08��9��3�� ȡ�������� ����Ч��
	--ʩ���Ӽ���_����
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		450,
--		dwSkillLevel
--	);
	--ʩ�Ŷ���_�Ӽ���_����     ,�������ڹ�
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		449,
--		dwSkillLevel
--	);

	skill.BindBuff(1, 8419, 1); --���BUFF

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.SPOOF,
		0,
		0
	);

	
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--����CD1��
	--skill.SetNormalCoolDown(1, 93);
	--skill.SetNormalCoolDown(2, 259);
	--skill.SetCheckCoolDown(1, 444)
	----------------- ���ܳ�� -------------------------------------------------
	skill.nBaseThreat = tSkillData[dwSkillLevel].nThreat;

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
--	skill.nCostManaBasePercent = 167;	-- �������ĵ�����
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nChannelInterval	= 15; 				-- ͨ�������ʱ��
	--skill.nChannelFrame		= 48;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate      = 0 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024

	----------------- ����������� ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nWeaponDamagePercent = 0;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 20 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256

	skill.nPrepareFrames = 0;										--����֡��,16֡����1��

	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡

	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
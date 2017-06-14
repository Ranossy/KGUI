---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_�����¼�_�����к�ˢ���Ʒ��DOT3Ŀ��.lua
-- ����ʱ��:	2015/6/15 15:31:20
-- �����û�:	XIAXIANBO
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_����ǹ��_�Ʒ�.lua
-- ������    :  ����
-- ����ʱ��  :  2008-02-26 16:14
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����ǹ��
-- ��������  :  �Ʒ�
-- ����Ч��  :  ����Ŀ��һ����ѪЧ����
--��������״̬��,�ü��ܴ����Ƽ�Ч��,������������ޡ�

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--���ӳ���ݶ��ͼ����˺����
tSkillData =
{
	{nCostMana = 14, nDotID = 661, nDotLevel = 1, nThreat = 259   }, -- Level 1
	{nCostMana = 22, nDotID = 661, nDotLevel = 2, nThreat = 389   }, -- Level 2
	{nCostMana = 29, nDotID = 661, nDotLevel = 3, nThreat = 518   }, -- Level 3
	{nCostMana = 40, nDotID = 661, nDotLevel = 4, nThreat = 648   }, -- Level 4
	{nCostMana = 49, nDotID = 661, nDotLevel = 5, nThreat = 778   }, -- Level 5
	{nCostMana = 57, nDotID = 661, nDotLevel = 6, nThreat = 907   }, -- Level 6
	{nCostMana = 65, nDotID = 661, nDotLevel = 7, nThreat = 1037  }, -- Level 7
	{nCostMana = 73, nDotID = 661, nDotLevel = 8, nThreat = 1166  }, -- Level 8
	{nCostMana = 81, nDotID = 661, nDotLevel = 9, nThreat = 1296  }, -- Level 9
	{nCostMana = 90, nDotID = 661, nDotLevel = 10, nThreat = 1426  }, -- Level 10
	{nCostMana = 90, nDotID = 661, nDotLevel = 11, nThreat = 1705  }, -- Level 11
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	skill.AddSlowCheckDestBuff(8003, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ����Ŀ��Buff
	--skill.AddSlowCheckDestOwnBuff(3442, 0,BUFF_COMPARE_FLAG.GREATER , 0, BUFF_COMPARE_FLAG.GREATER);
	--skill.AddSlowCheckDestOwnBuff(3442, 1, BUFF_COMPARE_FLAG.EQUAL, dwSkillLevel, BUFF_COMPARE_FLAG.EQUAL);
	--skill.AddSlowCheckDestOwnBuff(661,0,BUFF_COMPARE_FLAG.GREATER , dwSkillLevel, BUFF_COMPARE_FLAG.EQUAL);
	skill.BindBuff(1, 3442, dwSkillLevel)  --��Ѫ
	--skill.BindBuff(2, 661, dwSkillLevel)  --����
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/���/90����Ѩ/��ħ_�Ʒ��Ƽ�Ч��.lua", -- ����ֵ1
		0														-- ����ֵ2
		);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/���/90����Ѩ/�Ʒ��������Ч��.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	--ʩ�� �Ӽ��� ��������״̬��,�����Ƽ�Ч��,�����������
--[[	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		407,
		dwSkillLevel
	);--]]
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--����CD1��
	--skill.SetNormalCoolDown(1, 92);
	--skill.SetCheckCoolDown(1, 444)

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
--skill.nCostManaBasePercent = 0.5*(1+dwSkillLevel/11)*93;	-- �������ĵ�����
	----------------- ����������� ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	skill.nWeaponDamagePercent = 0;
	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;							--����ʩ�����뾶
	skill.nAngleRange = 256; 										--ʩ�ŽǶ�,ȫ��256
	skill.nAreaRadius = 6 * LENGTH_BASE*1.1;
	--skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
	skill.nChannelInterval = 346*1.1;
	--skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
	skill.nTargetCountLimit = 3;
	--skill.nBreakRate        = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������

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
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end

	if not target then
		return
	end

	local lv = player.GetSkillLevel(401)
	--�Ʒ�AOEЧ��
	if player.GetSkillLevel(6523) == 1 and lv ~= 0 then
		--player.CastSkill(6521, lv)
		target.AddBuff(0, 99, 8003, 1)
		player.CastSkillXYZ(6521, lv, target.nX, target.nY, target.nZ)
		target.DelBuff(8003, 1)
	end
	
	--�Ʒ�����
	if player.IsSkillRecipeActive(2005, 1) then
		if player.IsSkillRecipeActive(375, 1) then
			player.CastSkill(8139, 2)
		else
			player.CastSkill(8139, 1)
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
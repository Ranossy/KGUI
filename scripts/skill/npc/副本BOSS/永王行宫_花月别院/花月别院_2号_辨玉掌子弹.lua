---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�����й�_���±�Ժ/���±�Ժ_2��_�������ӵ�.lua
-- ����ʱ��:	2015/5/21 15:49:09
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamage = 7700, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamage = 9400, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamage = 10000, nDamageRand = 0, nCostMana = 0}, --level 3
	{nDamage = 15000, nDamageRand = 0, nCostMana = 0}, --level 4
	{nDamage = 0, nDamageRand = 0, nCostMana = 0}, --level 5
	{nDamage = 0, nDamageRand = 0, nCostMana = 0}, --level 6
	{nDamage = 0, nDamageRand = 0, nCostMana = 0}, --level 7
	{nDamage = 0, nDamageRand = 0, nCostMana = 0}, --level 8
	{nDamage = 0, nDamageRand = 0, nCostMana = 0}, --level 9
	{nDamage = 0, nDamageRand = 0, nCostMana = 0}, --level 10
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	--[[skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);--]]

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/npc/����BOSS/�����й�_���±�Ժ/���±�Ժ_2��_�������ӵ�.lua", --����ֵ1
		0															--����ֵ2
	);

	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, BUFF_COMPARE_FLAG.Result, nLevel, BUFF_COMPARE_FLAG.Result);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, BUFF_COMPARE_FLAG.Result, nLevel, BUFF_COMPARE_FLAG.Result);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, BUFF_COMPARE_FLAG.Result, nLevel, BUFF_COMPARE_FLAG.Result);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, BUFF_COMPARE_FLAG.Result, nLevel, BUFF_COMPARE_FLAG.Result);	-- ����Ŀ�������Լ���Buff

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--������ͨCD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID

	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 100 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius = 100 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 30;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=

	----------------- ����Ѫ������ ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
	--skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=

	----------------- ���˴��������� -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0

	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

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

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSrcID)
	local npc = GetNpc(dwSrcID)
	if npc then
		local scene = npc.GetScene()
		scene.SetTimer(0.9 * GLOBAL.GAME_FPS, "scripts/skill/npc/����BOSS/�����й�_���±�Ժ/���±�Ժ_2��_�������ӵ�.lua", dwSrcID, 1)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnTimer(scene, nParam1, nParam2)
	local npc = GetNpc(nParam1)
	if not npc then
		return
	end

	--local scene = npc.GetScene()
	local num = npc.GetCustomInteger4(8)
	local maomao = scene.GetNpcByNickName("moyudemaomao")
	local keren = scene.GetNpcByNickName("moyudekeren")
	local playerlist = scene.GetAllPlayer()
	local k = 0
	if scene.dwMapID == 221 then---10�˻���
		if num == 1 then
			if maomao then
				for i = 1, #playerlist do
					local playertarget = GetPlayer(playerlist[i])
					if playertarget and playertarget.nMoveState ~= MOVE_STATE.ON_DEATH then
						if GetCharacterDistance(maomao.dwID, playertarget.dwID) <= 384 then
							k = k + 1
						end
					end
				end
	
				if k >= 3 then
					npc.CastSkillXYZ(13903, 1, maomao.nX, maomao.nY, maomao.nZ)
					if maomao.nCurrentLife > 200400 then
						maomao.nCurrentLife = maomao.nCurrentLife - 200400
					else
						maomao.Die()
					end
				end
	
				if k == 2 then
					npc.CastSkillXYZ(13903, 2, maomao.nX, maomao.nY, maomao.nZ)
					if maomao.nCurrentLife > 400900 then
						maomao.nCurrentLife = maomao.nCurrentLife - 400900
					else
						maomao.Die()
					end
				end
	
				if k == 1 or k == 0 then
					npc.CastSkillXYZ(13903, 3, maomao.nX, maomao.nY, maomao.nZ)
					if maomao.nCurrentLife > 801800 then
						maomao.nCurrentLife = maomao.nCurrentLife - 801800
					else
						maomao.Die()
					end
				end
				npc.PlaySfx(1135, maomao.nX, maomao.nY, maomao.nZ)
			end
		end
	
		if num == 2 then
			if keren then
				for i = 1, #playerlist do
					local playertarget = GetPlayer(playerlist[i])
					if playertarget and playertarget.nMoveState ~= MOVE_STATE.ON_DEATH then
						if GetCharacterDistance(keren.dwID, playertarget.dwID) <= 384 then
							k = k + 1
						end
					end
				end
	
				if k >= 3 then
					npc.CastSkillXYZ(13903, 1, keren.nX, keren.nY, keren.nZ)
					if keren.nCurrentLife > 200400 then
						keren.nCurrentLife = keren.nCurrentLife - 200400
					else
						keren.Die()
					end
				end
	
				if k == 2 then
					npc.CastSkillXYZ(13903, 2, keren.nX, keren.nY, keren.nZ)
					if keren.nCurrentLife > 400900 then
						keren.nCurrentLife = keren.nCurrentLife - 400900
					else
						keren.Die()
					end
				end
	
				if k == 1 or k == 0 then
					npc.CastSkillXYZ(13903, 3, keren.nX, keren.nY, keren.nZ)
					if keren.nCurrentLife > 801800 then
						keren.nCurrentLife = keren.nCurrentLife - 801800
					else
						keren.Die()
					end
				end
				npc.PlaySfx(1135, keren.nX, keren.nY, keren.nZ)
			end
		end
	end

	if scene.dwMapID == 230 or scene.dwMapID == 233 then------25�˺Ͱ�Ứ��
		if num == 1 then
			if maomao then
				for i = 1, #playerlist do
					local playertarget = GetPlayer(playerlist[i])
					if playertarget and playertarget.nMoveState ~= MOVE_STATE.ON_DEATH then
						if GetCharacterDistance(maomao.dwID, playertarget.dwID) <= 384 then
							k = k + 1
						end
					end
				end
	
				if k >= 8 then
					npc.CastSkillXYZ(13903, 4, maomao.nX, maomao.nY, maomao.nZ)
					if maomao.nCurrentLife > 505200 then
						maomao.nCurrentLife = maomao.nCurrentLife - 505200
					else
						maomao.Die()
					end
				end
	
				if k >= 3 and k <= 7 then
					npc.CastSkillXYZ(13903, 5, maomao.nX, maomao.nY, maomao.nZ)
					if maomao.nCurrentLife > 1010400 then
						maomao.nCurrentLife = maomao.nCurrentLife - 1010400
					else
						maomao.Die()
					end
				end
	
				if k <= 2 then
					npc.CastSkillXYZ(13903, 6, maomao.nX, maomao.nY, maomao.nZ)
					if maomao.nCurrentLife > 2020900 then
						maomao.nCurrentLife = maomao.nCurrentLife - 2020900
					else
						maomao.Die()
					end
				end
				npc.PlaySfx(1135, maomao.nX, maomao.nY, maomao.nZ)
			end
		end
	
		if num == 2 then
			if keren then
				for i = 1, #playerlist do
					local playertarget = GetPlayer(playerlist[i])
					if playertarget and playertarget.nMoveState ~= MOVE_STATE.ON_DEATH then
						if GetCharacterDistance(keren.dwID, playertarget.dwID) <= 384 then
							k = k + 1
						end
					end
				end
	
				if k >= 8 then
					npc.CastSkillXYZ(13903, 4, keren.nX, keren.nY, keren.nZ)
					if keren.nCurrentLife > 505200 then
						keren.nCurrentLife = keren.nCurrentLife - 505200
					else
						keren.Die()
					end
				end
	
				if k >= 3 and k <= 7 then
					npc.CastSkillXYZ(13903, 5, keren.nX, keren.nY, keren.nZ)
					if keren.nCurrentLife > 1010400 then
						keren.nCurrentLife = keren.nCurrentLife - 1010400
					else
						keren.Die()
					end
				end
	
				if k <= 2 then
					npc.CastSkillXYZ(13903, 6, keren.nX, keren.nY, keren.nZ)
					if keren.nCurrentLife > 2020900 then
						keren.nCurrentLife = keren.nCurrentLife - 2020900
					else
						keren.Die()
					end
				end
				npc.PlaySfx(1135, keren.nX, keren.nY, keren.nZ)
			end
		end
	end

	if scene.dwMapID == 235 then---10����ս����
		if num == 1 then
			if maomao then
				for i = 1, #playerlist do
					local playertarget = GetPlayer(playerlist[i])
					if playertarget and playertarget.nMoveState ~= MOVE_STATE.ON_DEATH then
						if GetCharacterDistance(maomao.dwID, playertarget.dwID) <= 384 then
							k = k + 1
						end
					end
				end
	
				if k >= 3 then
					npc.CastSkillXYZ(13903, 7, maomao.nX, maomao.nY, maomao.nZ)
					if maomao.nCurrentLife > 121700 then
						maomao.nCurrentLife = maomao.nCurrentLife - 121700
					else
						maomao.Die()
					end
				end
	
				if k == 2 then
					npc.CastSkillXYZ(13903, 8, maomao.nX, maomao.nY, maomao.nZ)
					if maomao.nCurrentLife > 243500 then
						maomao.nCurrentLife = maomao.nCurrentLife - 243500
					else
						maomao.Die()
					end
				end
	
				if k == 1 or k == 0 then
					npc.CastSkillXYZ(13903, 9, maomao.nX, maomao.nY, maomao.nZ)
					if maomao.nCurrentLife > 487000 then
						maomao.nCurrentLife = maomao.nCurrentLife - 487000
					else
						maomao.Die()
					end
				end
				npc.PlaySfx(1135, maomao.nX, maomao.nY, maomao.nZ)
			end
		end
	
		if num == 2 then
			if keren then
				for i = 1, #playerlist do
					local playertarget = GetPlayer(playerlist[i])
					if playertarget and playertarget.nMoveState ~= MOVE_STATE.ON_DEATH then
						if GetCharacterDistance(keren.dwID, playertarget.dwID) <= 384 then
							k = k + 1
						end
					end
				end
	
				if k >= 3 then
					npc.CastSkillXYZ(13903, 7, keren.nX, keren.nY, keren.nZ)
					if keren.nCurrentLife > 121700 then
						keren.nCurrentLife = keren.nCurrentLife - 121700
					else
						keren.Die()
					end
				end
	
				if k == 2 then
					npc.CastSkillXYZ(13903, 8, keren.nX, keren.nY, keren.nZ)
					if keren.nCurrentLife > 243500 then
						keren.nCurrentLife = keren.nCurrentLife - 243500
					else
						keren.Die()
					end
				end
	
				if k == 1 or k == 0 then
					npc.CastSkillXYZ(13903, 9, keren.nX, keren.nY, keren.nZ)
					if keren.nCurrentLife > 487000 then
						keren.nCurrentLife = keren.nCurrentLife - 487000
					else
						keren.Die()
					end
				end
				npc.PlaySfx(1135, keren.nX, keren.nY, keren.nZ)
			end
		end
	end

	if scene.dwMapID == 237 then------25����ս����
		if num == 1 then
			if maomao then
				for i = 1, #playerlist do
					local playertarget = GetPlayer(playerlist[i])
					if playertarget and playertarget.nMoveState ~= MOVE_STATE.ON_DEATH then
						if GetCharacterDistance(maomao.dwID, playertarget.dwID) <= 384 then
							k = k + 1
						end
					end
				end
				
				if k >= 9 then
					npc.CastSkillXYZ(13903, 10, maomao.nX, maomao.nY, maomao.nZ)
					if maomao.nCurrentLife > 578300 then
						maomao.nCurrentLife = maomao.nCurrentLife - 578300
					else
						maomao.Die()
					end
				end
	
				if k >= 4 and k <= 8 then
					npc.CastSkillXYZ(13903, 11, maomao.nX, maomao.nY, maomao.nZ)
					if maomao.nCurrentLife > 1156600 then
						maomao.nCurrentLife = maomao.nCurrentLife - 1156600
					else
						maomao.Die()
					end
				end
	
				if k <= 3 then
					npc.CastSkillXYZ(13903, 12, maomao.nX, maomao.nY, maomao.nZ)
					if maomao.nCurrentLife > 2313200 then
						maomao.nCurrentLife = maomao.nCurrentLife - 2313200
					else
						maomao.Die()
					end
				end
				npc.PlaySfx(1135, maomao.nX, maomao.nY, maomao.nZ)
			end
		end
	
		if num == 2 then
			if keren then
				for i = 1, #playerlist do
					local playertarget = GetPlayer(playerlist[i])
					if playertarget and playertarget.nMoveState ~= MOVE_STATE.ON_DEATH then
						if GetCharacterDistance(keren.dwID, playertarget.dwID) <= 384 then
							k = k + 1
						end
					end
				end
	
				if k >= 9 then
					npc.CastSkillXYZ(13903, 10, keren.nX, keren.nY, keren.nZ)
					if keren.nCurrentLife > 578300 then
						keren.nCurrentLife = keren.nCurrentLife - 578300
					else
						keren.Die()
					end
				end
	
				if k >= 4 and k <= 8 then
					npc.CastSkillXYZ(13903, 11, keren.nX, keren.nY, keren.nZ)
					if keren.nCurrentLife > 1156600 then
						keren.nCurrentLife = keren.nCurrentLife - 1156600
					else
						keren.Die()
					end
				end
	
				if k <= 3 then
					npc.CastSkillXYZ(13903, 12, keren.nX, keren.nY, keren.nZ)
					if keren.nCurrentLife > 2313200 then
						keren.nCurrentLife = keren.nCurrentLife - 2313200
					else
						keren.Die()
					end
				end
				npc.PlaySfx(1135, keren.nX, keren.nY, keren.nZ)
			end
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com